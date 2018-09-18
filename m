Content-Type: multipart/mixed; boundary="===============3715672828522477608=="
MIME-Version: 1.0
From: David Howells <dhowells@redhat.com>
To: lkp@lists.01.org
Subject: Re: [linux] c208f0c9ab: general_protection_fault:#[##]
Date: Tue, 18 Sep 2018 10:16:52 +0100
Message-ID: <8302.1537262212@warthog.procyon.org.uk>
In-Reply-To: <4756.1537259020@warthog.procyon.org.uk>
List-Id: <oe-lkp.lists.linux.dev>

--===============3715672828522477608==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable


> =C2=A0=C2=A0 0xffffffff813dcd17 <+39>:=C2=A0=C2=A0=C2=A0 test=C2=A0=C2=A0=
 %rax,%rax
> =C2=A0=C2=A0 0xffffffff813dcd1a <+42>:=C2=A0=C2=A0=C2=A0 je=C2=A0=C2=A0=
=C2=A0=C2=A0 0xffffffff813dcd41 <mqueue_get_tree+81>

Oh, and at this point, RAX holds ctx->ipc_ns->mq_mnt - so it appears that t=
he
ipc_namespace object is corrupt in some way.

> =C2=A0=C2=A0 0xffffffff813dcd1c <+44>:=C2=A0=C2=A0=C2=A0 mov=C2=A0=C2=A0=
=C2=A0 0x8(%rax),%rax
> =C2=A0=C2=A0 0xffffffff813dcd20 <+48>:=C2=A0=C2=A0=C2=A0 mov=C2=A0=C2=A0=
=C2=A0 0x68(%rax),%rbp

David

--===============3715672828522477608==--

