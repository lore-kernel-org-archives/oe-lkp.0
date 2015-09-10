Content-Type: multipart/mixed; boundary="===============5641169001646072628=="
MIME-Version: 1.0
From: Ashwin Chaugule <ashwin.chaugule@linaro.org>
To: lkp@lists.01.org
Subject: Re: [PCC] d3c68f218f: PCCT header not found.
Date: Wed, 09 Sep 2015 22:38:53 -0400
Message-ID: <CAJ5Y-ebyGkxuU-T0xD0usw+Aa81cP_ifW8UMqcjbNC_OyxB34Q@mail.gmail.com>
In-Reply-To: <87vbbjau1v.fsf@yhuang-dev.intel.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============5641169001646072628==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hello,

On 9 September 2015 at 22:26, kernel test robot <ying.huang@intel.com> wr=
ote:
> FYI, we noticed the below changes on
>
> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
> commit d3c68f218f927bd4b14b586ea2dcecee54cf09ad ("PCC: Initialize PCC Mai=
lbox earlier at boot")
>
> We found the following new message in kernel log after your commit.
> This may make the end user confusing.
>
> [    0.714306] PCCT header not found.
>

Looks like you enabled CONFIG_PCC on a system which doesn't support
it. The following commit disables it by default:

https://git.kernel.org/cgit/linux/kernel/git/torvalds/linux.git/commit/driv=
ers/mailbox/Kconfig?id=3Db6fc6072b1268a0025850cd9d3dce25a7be0158d

Ashwin

--===============5641169001646072628==--

