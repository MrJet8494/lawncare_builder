from flask import Flask, render_template, request, jsonify
import sqlite3

app = Flask(__name__)

def get_db_connection():
    conn = sqlite3.connect('lawncare.db')
    conn.row_factory = sqlite3.Row
    return conn

@app.route('/')
def index():
    return render_template('index.html')

@app.route('/grass-types')
def grass_types():
    return jsonify([
        {'id': 1, 'name': 'St. Augustine'},
        {'id': 2, 'name': 'Bahia'},
        {'id': 3, 'name': 'Bermuda'},
        {'id': 4, 'name': 'Zoysia'},
        {'id': 5, 'name': 'Centipede'}
    ])

@app.route('/compatible-products')
def compatible_products():
    grass_id = request.args.get('grass_id')
    if not grass_id:
        return jsonify([])

    conn = get_db_connection()

    # Get the "value" mower and weedwacker (hardcoded for now)
    mower = conn.execute('SELECT name, category, description FROM products WHERE id = 1').fetchone()  # Honda
    weedwacker = conn.execute('SELECT name, category, description FROM products WHERE id = 5').fetchone()  # Echo

    # Get grass-safe fertilizer, herbicide, pesticide
    safe_products = conn.execute('''
        SELECT p.name, p.category, p.description
        FROM products p
        JOIN product_compatibility pc ON p.id = pc.product_id
        WHERE pc.grass_id = ? AND p.category IN ('Fertilizer', 'Herbicide', 'Pesticide')
        ORDER BY p.id
    ''', (grass_id,)).fetchall()

    fertilizer = next((p for p in safe_products if p['category'] == 'Fertilizer'), None)
    herbicide = next((p for p in safe_products if p['category'] == 'Herbicide'), None)
    pesticide = next((p for p in safe_products if p['category'] == 'Pesticide'), None)

    conn.close()

    # Build Google Search links
    def google_link(product): return f"https://www.google.com/search?q={'+'.join(product['name'].split())}"

    response = {
        'mower': {
            'name': mower['name'],
            'description': mower['description'],
            'link': google_link(mower)
        },
        'weedwacker': {
            'name': weedwacker['name'],
            'description': weedwacker['description'],
            'link': google_link(weedwacker)
        },
        'fertilizer': {
            'name': fertilizer['name'],
            'description': fertilizer['description'],
            'link': google_link(fertilizer)
        } if fertilizer else None,
        'herbicide': {
            'name': herbicide['name'],
            'description': herbicide['description'],
            'link': google_link(herbicide)
        } if herbicide else None,
        'pesticide': {
            'name': pesticide['name'],
            'description': pesticide['description'],
            'link': google_link(pesticide)
        } if pesticide else None,
    }

    return jsonify(response)

if __name__ == '__main__':
    app.run(debug=True)
