# -*- Mode: Python; coding: utf-8; indent-tabs-mode: nil; tab-width: 4 -*-
# Copyright 2013 Canonical
#
# This program is free software: you can redistribute it and/or modify it
# under the terms of the GNU General Public License version 3, as published
# by the Free Software Foundation.

"""Tests for the Mediaplayer App"""

from autopilot.matchers import Eventually
from testtools.matchers import Equals

from address_book_app.tests import AddressBookAppTestCase


class TestContactList(AddressBookAppTestCase):
    """Tests the contact list features"""

    def test_contact_list(self):
        contact_list = self.app.main_window.get_contact_list_page()
        self.assertThat(contact_list.visible, Eventually(Equals(True)))
        pass
