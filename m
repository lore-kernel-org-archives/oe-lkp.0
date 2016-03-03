Content-Type: multipart/mixed; boundary="===============3172259778586094123=="
MIME-Version: 1.0
From: Sudip Mukherjee <sudipm.mukherjee@gmail.com>
To: lkp@lists.01.org
Subject: Re: [ppdev] e7223f1860: kernel BUG at drivers/base/driver.c:153!
Date: Thu, 03 Mar 2016 11:21:33 +0530
Message-ID: <20160303055133.GA4152@sudip-pc>
In-Reply-To: <CAOxpaSVZRafSHiyDUUZ59uAydsw_kEv-JF=J9uDX0D7j_Lg1yQ@mail.gmail.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============3172259778586094123==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Wed, Mar 02, 2016 at 02:24:22PM -0700, Ross Zwisler wrote:
> On Mon, Feb 15, 2016 at 4:50 AM, Sudip Mukherjee
> <sudipm.mukherjee@gmail.com> wrote:
> > On Mon, Feb 15, 2016 at 04:20:45PM +0800, kernel test robot wrote:
> >> Greetings,
> >>
> >> 0day kernel testing robot got the below dmesg and the first bad commit=
 is
> >>
> >> https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/char-misc.git c=
har-misc-testing
> >>
> >> commit e7223f18603374d235d8bb0398532323e5f318b9
> >> Author:     Sudip Mukherjee <sudipm.mukherjee@gmail.com>
> >> AuthorDate: Fri Feb 12 18:33:45 2016 +0530
> >> Commit:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> >> CommitDate: Sun Feb 14 17:43:50 2016 -0800
> >>
<snip>
> =

> I've been hitting this error on my KVM system as well, and bisected to
> the same commit.
> =

> The patch you have here solved the issue for me.

I will submit the patch today. I am sorry for the delay, i got held up
in some other things. Since you have tested this can I add your
Tested-by: to the patch?

regards
sudip

--===============3172259778586094123==--

