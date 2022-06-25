from django.contrib.auth.models import User
from django.test import TestCase

from order.models import OrderModel


class OrderModelTest(TestCase):

    def setUp(self):
        User.objects.create_user('temporary', 'temporary@gmail.com', 'temporary')
        self.client.login(username='temporary', password='temporary')

    @classmethod
    def setUpTestData(cls):
        OrderModel.objects.create(user_id=1, productName='Pizza', weight=0.5, description='Nice pizza with Bananas',
                                  price=600,
                                  reward=50, contacts='@Vldmr11')

    def test_productName_label(self):
        order = OrderModel.objects.get(id=1)
        field_label = order._meta.get_field('productName').verbose_name
        self.assertEquals(field_label, 'productName')

    def test_weight_label(self):
        order = OrderModel.objects.get(id=1)
        field_label = order._meta.get_field('weight').verbose_name
        self.assertEquals(field_label, 'weight')

    def test_description_label(self):
        order = OrderModel.objects.get(id=1)
        field_label = order._meta.get_field('description').verbose_name
        self.assertEquals(field_label, 'description')

    def test_price_label(self):
        order = OrderModel.objects.get(id=1)
        field_label = order._meta.get_field('price').verbose_name
        self.assertEquals(field_label, 'price')

    def test_reward_label(self):
        order = OrderModel.objects.get(id=1)
        field_label = order._meta.get_field('reward').verbose_name
        self.assertEquals(field_label, 'reward')

    def test_contacts_label(self):
        order = OrderModel.objects.get(id=1)
        field_label = order._meta.get_field('contacts').verbose_name
        self.assertEquals(field_label, 'contacts')

    def test_productName_max_length(self):
        order = OrderModel.objects.get(id=1)
        max_length = order._meta.get_field('productName').max_length
        self.assertEquals(max_length, 100)

    def test_description_max_length(self):
        order = OrderModel.objects.get(id=1)
        max_length = order._meta.get_field('description').max_length
        self.assertEquals(max_length, 200)

    def test_contacts_max_length(self):
        order = OrderModel.objects.get(id=1)
        max_length = order._meta.get_field('productName').max_length
        self.assertEquals(max_length, 100)

