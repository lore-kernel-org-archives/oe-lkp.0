Content-Type: multipart/mixed; boundary="===============0890503380548197456=="
MIME-Version: 1.0
From: Christoph Hellwig <hch@lst.de>
To: lkp@lists.01.org
Subject: Re: [block] f216fdd77b: BUG:kernel_reboot-without-warning_in_boot_stage
Date: Mon, 09 Dec 2019 09:36:37 +0100
Message-ID: <20191209083637.GA15038@lst.de>
In-Reply-To: <a67a0920-472f-7f86-299a-097bc2986a1c@intel.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============0890503380548197456==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Mon, Dec 09, 2019 at 04:08:56PM +0800, Rong Chen wrote:
> Hi Christoph,
>
> Kernel boot failed in early stage with commit "f216fdd77b":

Well, this config (plus enabling virtio for real) boots just fine for
me.  There is nothing in your dmesgs, which makes me assume the boot
stage means really early?  Nothing touched in this commit is involved
in the very early boot path, though.
--===============0890503380548197456==--

