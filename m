Content-Type: multipart/mixed; boundary="===============0204278906804337734=="
MIME-Version: 1.0
From: Christoph Hellwig <hch@lst.de>
To: lkp@lists.01.org
Subject: Re: [scsi] 6aded12b10: kernel_BUG_at_mm/usercopy.c
Date: Thu, 24 Mar 2022 07:48:46 +0100
Message-ID: <20220324064846.GA12961@lst.de>
In-Reply-To: <202203230809.D63BF9511@keescook>
List-Id: <oe-lkp.lists.linux.dev>

--===============0204278906804337734==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Wed, Mar 23, 2022 at 08:40:30AM -0700, Kees Cook wrote:
> This series removes it:
> https://lore.kernel.org/linux-hardening/20220110231530.665970-1-willy(a)i=
nfradead.org/

If HARDENED_USERCOPY_PAGESPAN is so broken we really should remove it
ASAP independent of the other patches in the series.

--===============0204278906804337734==--

