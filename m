Content-Type: multipart/mixed; boundary="===============6904520316432782605=="
MIME-Version: 1.0
From: David Howells <dhowells@redhat.com>
To: lkp@lists.01.org
Subject: Re: [ipc] 61224adcd2: general_protection_fault:#[##]
Date: Wed, 19 Sep 2018 00:23:00 +0100
Message-ID: <5176.1537312980@warthog.procyon.org.uk>
In-Reply-To: <20180913010517.GB7632@shao2-debian>
List-Id: <oe-lkp.lists.linux.dev>

--===============6904520316432782605==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Okay, I managed to run the job script for about 6 hours, but saw no problem=
s.
I'm guessing it's one of those things that you have to hit just right.

I've updated my mount-api and fsinfo branches to remove the "shortcut" code
from mqueue_get_tree() and just rely on vfs_get_super() finding a duplicate
superblock.

I'll ask Al to pull it tomorrow if I can work out solutions to Stephen's
issues with building the sample programs.

David

--===============6904520316432782605==--

