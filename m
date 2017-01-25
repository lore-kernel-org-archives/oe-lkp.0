Content-Type: multipart/mixed; boundary="===============2222651204984106110=="
MIME-Version: 1.0
From: Michael S. Tsirkin <mst@redhat.com>
To: lkp@lists.01.org
Subject: Re: [virtio_pci] 563d3bbe44: WARNING: CPU: 0 PID: 1 at kernel/irq/manage.c:1478 __free_irq
Date: Wed, 25 Jan 2017 16:24:32 +0200
Message-ID: <20170125162357-mutt-send-email-mst@kernel.org>
In-Reply-To: <20170125113210.GA19330@lst.de>
List-Id: <oe-lkp.lists.linux.dev>

--===============2222651204984106110==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Wed, Jan 25, 2017 at 12:32:10PM +0100, Christoph Hellwig wrote:
> Hi Michael,
> =

> I've reproduced the issue, and it's pretty simple:  the test config
> has MSI support disabled, so we always fail the attempt at using MSI-X
> vectors.  And the cleanup in the code was a mess that didn't get
> any better with my patches.
> =

> I'll fix all that up and will resend soon.

Thanks!

-- =

MST

--===============2222651204984106110==--

