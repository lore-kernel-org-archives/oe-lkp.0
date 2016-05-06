Content-Type: multipart/mixed; boundary="===============4993893845478304389=="
MIME-Version: 1.0
From: Vitaly Kuznetsov <vkuznets@redhat.com>
To: lkp@lists.01.org
Subject: Re: [string_helpers] 726ecfc321: test_string_helpers: Test 'test_string_get_size_one' failed!
Date: Fri, 06 May 2016 10:30:14 +0200
Message-ID: <874mabr3l5.fsf@vitty.brq.redhat.com>
In-Reply-To: <20160506012646.GA4272@yexl-desktop>
List-Id: <oe-lkp.lists.linux.dev>

--===============4993893845478304389==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

kernel test robot <xiaolong.ye@intel.com> writes:

> FYI, we noticed the following commit:
>
> https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable.git l=
inux-4.4.y
> commit 726ecfc321994ec6ab044c1e3e5886408de991ac ("string_helpers: fix pre=
cision loss for some inputs")
>

The following commit:

commit 72676bb53f33fd0ef3a1484fc1ecfd306dc6ff40
Author: Vitaly Kuznetsov <vkuznets@redhat.com>
Date:   Tue Feb 2 16:57:18 2016 -0800

    lib/test-string_helpers.c: fix and improve string_get_size() tests
    =


should probably be backported to 4.4 as well.

-- =

  Vitaly

--===============4993893845478304389==--

