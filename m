Content-Type: multipart/mixed; boundary="===============7079311336573557952=="
MIME-Version: 1.0
From: Fengguang Wu <fengguang.wu@intel.com>
To: lkp@lists.01.org
Subject: Re: cross-compiling a 64-bit kernel on a 32-bit host
Date: Fri, 11 May 2018 11:39:50 +0800
Message-ID: <20180511033950.ahkey2jnsd5i2gvi@wfg-t540p.sh.intel.com>
In-Reply-To: <20180510223619.jwdlle42brksfp4v@treble>
List-Id: <oe-lkp.lists.linux.dev>

--===============7079311336573557952==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hi Josh,

CC LKP team.

On Thu, May 10, 2018 at 05:36:19PM -0500, Josh Poimboeuf wrote:
>Hi Fengguang,
>
>I occasionally get compilation bug reports from people who are
>cross-compiling an x86-64 kernel target on an x86-32 host.
>
>Any chance the 0-day build bot could test that configuration?  I think
>just building a defconfig would be sufficient.  It would help sort out
>issues in objtool and other host-built scripts.

To do that we'll need to create a new build chroot. Julie/Philip
should be able to evaluate the efforts and do the plan.

Thanks,
Fengguang

--===============7079311336573557952==--

