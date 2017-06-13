Content-Type: multipart/mixed; boundary="===============0821461514454508534=="
MIME-Version: 1.0
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: lkp@lists.01.org
Subject: Re: [Merge tag 'pci-v4.12-changes' of git] 857f864014: BUG: unable to handle kernel NULL pointer dereference at 00000000000000a8
Date: Tue, 13 Jun 2017 06:18:42 +0200
Message-ID: <20170613041842.GA13308@kroah.com>
In-Reply-To: <61e11e67-6c1b-ef1e-5fb8-a7c9efb17666@deltatee.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============0821461514454508534==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 12, 2017 at 05:34:59PM -0600, Logan Gunthorpe wrote:
> 1) The test we are looking at is overrunning the dynamic char dev major
> numbers by a lot. On a successful run, it gets down to 216 where the
> limit is 234. Thus, there are 18 too many major numbers assigned and the
> fact that this test used to work is really just luck. (I've cc'd
> developers from 49db08c3 for this issue.)

What test causes so many major numbers to be allocated?  Is this
in-kernel test code?  Do you really have a system that requires so many
different drivers that all want a dynamic char major?

thanks,

gre gk-h

--===============0821461514454508534==--

