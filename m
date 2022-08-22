Content-Type: multipart/mixed; boundary="===============7688525324009401897=="
MIME-Version: 1.0
From: Ammar Faizi <ammarfaizi2@gnuweeb.org>
To: lkp@lists.01.org
Subject: Re: [vrf] 2ef23e860e: kernel-selftests.net.fcnal-test.sh.fail
Date: Mon, 22 Aug 2022 16:57:58 +0700
Message-ID: <b500b1d9-f98e-40c3-1fc8-f3770a0adc84@gnuweeb.org>
In-Reply-To: <70e690da-df88-5d78-d25c-b01ce1f3f886@intel.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============7688525324009401897==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On 8/22/22 3:09 PM, Yujie Liu wrote:
> Do you suggest that if we find any issue on the branches like "for-5.*-lt=
s", we could also
> run a test on corresponding stable branch? We will consider this step in =
the future.

Yeah, it's good to test them. Because I park my patches for stable on those
branches. Usually that happens when I got a failed apply report from the
stable team that a patch can't cleanly apply to specific stable tree, so
manual changes needed to backport.

I rarely do it, though, but at least I always wait for build report from the
kernel test robot for those specific branches after pushed some changes :)

-- =

Ammar Faizi
--===============7688525324009401897==--

