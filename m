Content-Type: multipart/mixed; boundary="===============1757021799671706688=="
MIME-Version: 1.0
From: David Howells <dhowells@redhat.com>
To: lkp@lists.01.org
Subject: Re: [linux] c208f0c9ab: general_protection_fault:#[##]
Date: Tue, 18 Sep 2018 07:08:17 +0100
Message-ID: <6483.1537250897@warthog.procyon.org.uk>
In-Reply-To: <8d262b01-0e70-ebe5-85ac-28eee4800d36@intel.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============1757021799671706688==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Rong Chen <rong.a.chen@intel.com> wrote:

> >>> [   50.838927] RIP: 0010:mqueue_get_tree+0x2c/0xb0
> > Could you get me a disassembly of mqueue_get_tree()?
> $ faddr2line ./vmlinux mqueue_get_tree+0x2c
> mqueue_get_tree+0x2c/0xa3:
> mqueue_get_tree at ipc/mqueue.c:362

Yes, I know.  Could you get me a disassembly of that function?  When I build
it using your instructions, I don't see an instruction at 0x2c.

Thanks,
David

--===============1757021799671706688==--

