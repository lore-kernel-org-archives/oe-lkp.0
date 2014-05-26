Content-Type: multipart/mixed; boundary="===============2810821835911514771=="
MIME-Version: 1.0
From: Maurizio Lombardi <mlombard@redhat.com>
To: lkp@lists.01.org
Subject: [jet.chen@intel.com: [bio] kernel BUG at drivers/block/virtio_blk.c:166!]
Date: Mon, 26 May 2014 21:43:47 +0200
Message-ID: <20140526194347.GB2271@dhcp-27-189.brq.redhat.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============2810821835911514771==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hi Jens,

looks like that commit 3979ef4dcf3d1de55a560a3a4016c30a835df44d ("bio-modif=
y-__bio_add_page-to-accept-pages-that-dont-start-a-new-segment-v3")
introduces a regression, as reported by Jet Chan.

Do you have any idea about the possible problem with this patch?

it is the one that performs a recount of the segments in case of failure in=
 __bio_add_page()

http://www.spinics.net/lists/mm-commits/msg103684.html

I would not be surprised if the bug was introduced by fceb38f36f, because it
contained a mystake that commit 3979ef4dcf supposedly fixed.
But learning that commit 3979ef4dcf is introducing a regression leaves
me quite puzzled.

Thanks,
Maurizio Lombardi

--===============2810821835911514771==
Content-Type: message/rfc822
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="attachment.mht"


WzxlbWFpbC5tZXNzYWdlLk1lc3NhZ2UgaW5zdGFuY2UgYXQgMHg3ZjQwOTM5ZjhmODA+XQ==
--===============2810821835911514771==--

