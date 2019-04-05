Content-Type: multipart/mixed; boundary="===============6139079627581435994=="
MIME-Version: 1.0
From: Arkadiusz Hiler <arkadiusz.hiler@intel.com>
To: lkp@lists.01.org
Subject: kbuild test bot messages interfering up patchwork
Date: Fri, 05 Apr 2019 08:48:31 +0300
Message-ID: <20190405054831.kvcwzwzs2ev72v2i@ahiler-desk1.fi.intel.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============6139079627581435994==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hey all,

I hope this is the correct place for requests regarding kbuild automated
messages.

The request: Add 'X-Patchwork-Hint: comment' to email headers the bot sends.

Why: https://gitlab.freedesktop.org/patchwork-fdo/patchwork-fdo/issues/21

TL;DR: sending patch in a reply to a patch overwrites the original one
breaks our workflow with mailing lists. Adding the above hint would fix
that.

-- =

Cheers,
Arek

--===============6139079627581435994==--

