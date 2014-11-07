Content-Type: multipart/mixed; boundary="===============4886581707919885401=="
MIME-Version: 1.0
From: Matt Fleming <matt.fleming@intel.com>
To: lkp@lists.01.org
Subject: Re: [dmi] PANIC: early exception 0e rip 10:ffffffff81899e6b error 9 cr2 ffffffffff240000
Date: Fri, 07 Nov 2014 11:07:14 +0000
Message-ID: <1415358434.14686.119.camel@mfleming-mobl1.ger.corp.intel.com>
In-Reply-To: <20141107093031.GF24745@yliu-dev.sh.intel.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============4886581707919885401==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Fri, 2014-11-07 at 17:30 +0800, Yuanhan Liu wrote:
> =

> =

> The address changes to 10:ffffffff8167aa1a, and in the System.map, it has:
> =

>   ffffffff8167a9d0 t dmi_table
>   ffffffff8167aac0 T dmi_name_in_vendors
> =

> Sorry, I don't know how to dig furture.

Could you build a kernel without Ard's u32 cast fix and do,

objdump -dr vmlinux > /tmp/1

Then apply Ard's u32 cast fix, and rebuild the kernel and do,

objdump -dr vmlinux > /tmp/2

Then send me the output of,

diff -u /tmp/1 /tmp/2


--===============4886581707919885401==--

