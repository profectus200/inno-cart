from django.contrib.auth.models import User
from django.test import TestCase

from profile.models import ProfileModel


class ProfileListViewTest(TestCase):

    def setUp(self):
        User.objects.create_user('temporary', 'temporary@gmail.com', 'temporary')
        self.client.login(username='temporary', password='temporary')

    @classmethod
    def setUpTestData(cls):
        ProfileModel.objects.create(user_id=1, nickname='Vladimir', rating=5, dealsCompleted=10)

    def test_view_url_exists_at_desired_location(self):
        resp = self.client.get('/api/v1/profiles')
        self.assertEqual(resp.status_code, 200)
