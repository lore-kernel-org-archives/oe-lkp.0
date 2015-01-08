Content-Type: multipart/mixed; boundary="===============6281487023617943974=="
MIME-Version: 1.0
From: David Vrabel <david.vrabel@citrix.com>
To: lkp@lists.01.org
Subject: Re: [xen] 054954eb051f: -49.7% kernel-size.bss
Date: Thu, 08 Jan 2015 14:43:13 +0000
Message-ID: <54AE9781.5050501@citrix.com>
In-Reply-To: <1420685923.6201.91.camel@linux.intel.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============6281487023617943974==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On 08/01/15 02:58, Huang Ying wrote:
> FYI, we noticed the below changes on
> =

> commit 054954eb051f35e74b75a566a96fe756015352c8 ("xen: switch to linear v=
irtual mapped sparse p2m list")
> =

> testbox/testcase/testparams: vm-kbuild-yocto-ia32/boot/1
> =

> 0aad5689837c882d  054954eb051f35e74b75a566a9  =

> ----------------  --------------------------  =

>          %stddev     %change         %stddev
>              \          |                \  =

>    4161536 =C2=B1  0%     -49.7%    2093056 =C2=B1  0%  kernel-size.bss

This is a good thing, right?

>                                     kernel-size.bss
> =

>   4.5e+06 *+-*--*--*-*--*--*--*--*--*--*--*-*--*--*--*-------------------=
---+
>           |                                             *..*..           =
   |
>           |                                                   *..*.*..*..=
*..*
>     4e+06 ++                                                             =
   |
>           |                                                              =
   |
>           |                                                              =
   |
>   3.5e+06 ++                                                             =
   |
>           |                                                              =
   |
>     3e+06 ++                                                             =
   |
>           |                                                              =
   |
>           |                                                              =
   |
>   2.5e+06 ++                                                             =
   |
>           |                                                              =
   |
>           O  O  O  O O  O  O  O  O  O  O  O O  O  O  O  O  O  O  O O     =
   |
>     2e+06 ++-------------------------------------------------------------=
---+

I have no idea what this graph is supposed to be showing.

David

--===============6281487023617943974==--

