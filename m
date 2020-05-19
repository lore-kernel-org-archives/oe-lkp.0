Content-Type: multipart/mixed; boundary="===============3861521628322184517=="
MIME-Version: 1.0
From: Luciano Coelho <luciano.coelho@intel.com>
To: lkp@lists.01.org
Subject: Adding https://git.kernel.org/pub/scm/linux/kernel/git/iwlwifi/chromeos.git/ to 0-day bot
Date: Tue, 19 May 2020 16:25:19 +0300
Message-ID: <f0037eb65c160f67b433e893df8b286596164d16.camel@intel.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============3861521628322184517==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hi,

Would it be possible to add the following tree to the 0-day bot
verifications?

https://git.kernel.org/pub/scm/linux/kernel/git/iwlwifi/chromeos.git/

This is the tree we use to push our Intel WiFi driver to ChromeOS and
it is based on the upstream ChromeOS kernel trees.

The volume of tests is about 5-6 new branches every 6 weeks or so.

Additionally, we were wondering whether it's possible to remove or
choose which configurations we want to test against.  ChromeOS doesn't
run on most of the tested configurations, so it would be a waste of
resources (if that matters).

If you add this tree, please add the people in CC (including me) to the
list of recipients of the reports and since this is a feeding tree,
it's not relevant to make the results public.

Thank you!

--
Cheers,
Luca.

--===============3861521628322184517==--

