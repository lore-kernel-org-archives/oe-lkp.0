Content-Type: multipart/mixed; boundary="===============4707519586997878273=="
MIME-Version: 1.0
From: David Ahern <dsahern@gmail.com>
To: lkp@lists.01.org
Subject: Re: [ltp] 93531c6743:sctp6_ipsec_vti04.fail
Date: Tue, 21 Aug 2018 09:31:39 -0600
Message-ID: <b45ad7b6-94c8-c87c-3f0a-7fc5991080c8@gmail.com>
In-Reply-To: <cd63e2ba-5990-d1c9-2007-87be37dfcdff@intel.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============4707519586997878273==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On 8/21/18 1:46 AM, Rong Chen wrote:
> To reproduce:
> =

> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 git clone https://github.com/i=
ntel/lkp-tests.git
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 cd lkp-tests
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 bin/lkp qemu -k <bzImage> job-=
script # job-script is attached in
> this email

What am I missing?

lkp-tests.git$ bin/lkp qemu -k
~/kernel.git/kbuild/lkp/arch/x86/boot/bzImage /tmp/job-script
kernel module is required, please specify it with '-m'

--===============4707519586997878273==--

