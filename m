Content-Type: multipart/mixed; boundary="===============5794743007777940789=="
MIME-Version: 1.0
From: David Howells <dhowells@redhat.com>
To: lkp@lists.01.org
Subject: Re: [linux] c208f0c9ab: general_protection_fault:#[##]
Date: Tue, 18 Sep 2018 09:23:40 +0100
Message-ID: <4756.1537259020@warthog.procyon.org.uk>
In-Reply-To: <63a61582-8472-3564-3009-a218f9597ce7@intel.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============5794743007777940789==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Rong Chen <rong.a.chen@intel.com> wrote:

> =C2=A0=C2=A0 0xffffffff813dcd17 <+39>:=C2=A0=C2=A0=C2=A0 test=C2=A0=C2=A0=
 %rax,%rax
> =C2=A0=C2=A0 0xffffffff813dcd1a <+42>:=C2=A0=C2=A0=C2=A0 je=C2=A0=C2=A0=
=C2=A0=C2=A0 0xffffffff813dcd41 <mqueue_get_tree+81>
> =C2=A0=C2=A0 0xffffffff813dcd1c <+44>:=C2=A0=C2=A0=C2=A0 mov=C2=A0=C2=A0=
=C2=A0 0x8(%rax),%rax
> =C2=A0=C2=A0 0xffffffff813dcd20 <+48>:=C2=A0=C2=A0=C2=A0 mov=C2=A0=C2=A0=
=C2=A0 0x68(%rax),%rbp

Okay, this looks quite a lot different from what I see in the disassemblies=
 of
both my mount-api branch and linux-next - both with your config.

Anyway, looking at +44, RAX is the register of interest.

> [   50.872215] RAX: 646e655f73726f74 RBX: ffff88007b65f3c0 RCX: 000000000=
0000000

This looks like text to me: "tors_end".  git grep doesn't throw up anything
particularly interesting for that in the kernel sources.

David

--===============5794743007777940789==--

