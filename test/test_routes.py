import json

from .settings import DEFAULT_PRICE

def test_product_detail_api(client):
    id = 3
    response = client.get(f"/api/products/{id}")
    assert response.status_code == 200
    data = json.loads(response.data)
    assert id == data.get('id')
    assert DEFAULT_PRICE * id


def test_product_api(client):
    response = client.get("/api/products")
    assert response.status_code == 200

# post new cart
def test_post_cart(client):
    url = f"/api/cart"
    data = {
        "coupon_code": "dewa irtzadhany",
        "shipping_fee": 3,
        "cart_items": [
            {"product_id": 3, "qty": 3}
        ]
    }
    response = client.post(url, json=data)
    assert response.status_code == 200
    if response.status_code == 200:  assert "data created"

