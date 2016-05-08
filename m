Content-Type: multipart/mixed; boundary="===============4247217508793340131=="
MIME-Version: 1.0
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: lkp@lists.01.org
Subject: Re: [string_helpers] 726ecfc321: test_string_helpers: Test 'test_string_get_size_one' failed!
Date: Sun, 08 May 2016 19:12:16 +0200
Message-ID: <20160508171216.GC5065@kroah.com>
In-Reply-To: <874mabr3l5.fsf@vitty.brq.redhat.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============4247217508793340131==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Fri, May 06, 2016 at 10:30:14AM +0200, Vitaly Kuznetsov wrote:
> kernel test robot <xiaolong.ye@intel.com> writes:
> =

> > FYI, we noticed the following commit:
> >
> > https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable.git=
 linux-4.4.y
> > commit 726ecfc321994ec6ab044c1e3e5886408de991ac ("string_helpers: fix p=
recision loss for some inputs")
> >
> =

> The following commit:
> =

> commit 72676bb53f33fd0ef3a1484fc1ecfd306dc6ff40
> Author: Vitaly Kuznetsov <vkuznets@redhat.com>
> Date:   Tue Feb 2 16:57:18 2016 -0800
> =

>     lib/test-string_helpers.c: fix and improve string_get_size() tests
>     =

> =

> should probably be backported to 4.4 as well.

Thanks, now queued up.

greg k-h

--===============4247217508793340131==--

