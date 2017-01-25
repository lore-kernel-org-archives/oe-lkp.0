Content-Type: multipart/mixed; boundary="===============4004643155489581961=="
MIME-Version: 1.0
From: Christoph Hellwig <hch@lst.de>
To: lkp@lists.01.org
Subject: Re: [virtio_pci] 563d3bbe44: WARNING: CPU: 0 PID: 1 at kernel/irq/manage.c:1478 __free_irq
Date: Wed, 25 Jan 2017 12:32:10 +0100
Message-ID: <20170125113210.GA19330@lst.de>
In-Reply-To: <20161216001620-mutt-send-email-mst@kernel.org>
List-Id: <oe-lkp.lists.linux.dev>

--===============4004643155489581961==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hi Michael,

I've reproduced the issue, and it's pretty simple:  the test config
has MSI support disabled, so we always fail the attempt at using MSI-X
vectors.  And the cleanup in the code was a mess that didn't get
any better with my patches.

I'll fix all that up and will resend soon.

--===============4004643155489581961==--

