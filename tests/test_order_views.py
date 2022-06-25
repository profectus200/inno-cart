from django.contrib.auth.models import User
from django.test import TestCase

from order.models import OrderModel


class OrderListViewTest(TestCase):

    def setUp(self):
        User.objects.create_user('temporary', 'temporary@gmail.com', 'temporary')
        self.client.login(username='temporary', password='temporary')

    @classmethod
    def setUpTestData(cls):
        OrderModel.objects.create(user_id=1, productName='Pizza', weight=0.5, description='Nice pizza with Bananas',
                                  price=600,
                                  reward=50, contacts='@Vldmr11')

    def test_view_url_exists_at_desired_location(self):
        resp = self.client.get('/api/v1/orders')
        self.assertEqual(resp.status_code, 200)

    def test_view_personal_url_exists_at_desired_location(self):
        resp = self.client.get('/api/v1/personal')
        self.assertEqual(resp.status_code, 200)
