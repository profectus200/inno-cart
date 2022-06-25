from django.contrib.auth.models import User
from django.test import TestCase

from profile.models import ProfileModel


class ProfileModelTest(TestCase):

    def setUp(self):
        User.objects.create_user('temporary', 'temporary@gmail.com', 'temporary')
        self.client.login(username='temporary', password='temporary')

    @classmethod
    def setUpTestData(cls):
        ProfileModel.objects.create(user_id=1, nickname='Vladimir', rating=5, dealsCompleted=10)

    def test_nickname_label(self):
        profile = ProfileModel.objects.get(id=1)
        field_label = profile._meta.get_field('nickname').verbose_name
        self.assertEquals(field_label, 'nickname')

    def test_rating_label(self):
        profile = ProfileModel.objects.get(id=1)
        field_label = profile._meta.get_field('rating').verbose_name
        self.assertEquals(field_label, 'rating')

    def test_dealsCompleted_label(self):
        profile = ProfileModel.objects.get(id=1)
        field_label = profile._meta.get_field('dealsCompleted').verbose_name
        self.assertEquals(field_label, 'dealsCompleted')

    def test_nickname_max_length(self):
        profile = ProfileModel.objects.get(id=1)
        max_length = profile._meta.get_field('nickname').max_length
        self.assertEquals(max_length, 100)
