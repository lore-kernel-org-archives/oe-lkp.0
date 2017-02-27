Content-Type: multipart/mixed; boundary="===============3354771317227437211=="
MIME-Version: 1.0
From: Fengguang Wu <fengguang.wu@intel.com>
To: lkp@lists.01.org
Subject: Re: [platform/x86] 84c2f235ad BUG: KASAN: null-ptr-deref on address 0000000000000008
Date: Mon, 27 Feb 2017 13:27:12 +0800
Message-ID: <20170227052712.36gjmt4qdpwj2q4p@wfg-t540p.sh.intel.com>
In-Reply-To: <20170227052356.GJ3807@marvin.atrad.com.au>
List-Id: <oe-lkp.lists.linux.dev>

--===============3354771317227437211==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Mon, Feb 27, 2017 at 03:53:56PM +1030, Jonathan Woithe wrote:
>On Mon, Feb 27, 2017 at 12:58:40PM +0800, Fengguang Wu wrote:
>> Here is another bisect result. The attached reproduce-* script may
>> help debug the issue.
>
>Thanks for this.  FYI the cause of this issue is already understood (refer
>to previous linux-platform-driver ML discussions).  The relevant part of t=
he
>patch series (08/10) has been (or will be) reverted by Andy to resolve the
>problem for the moment (as per my earlier email).  The issue that part 08/=
10
>was aiming to fix will be addressed in a more complete way in a follow up
>patch series from Michael in due course as explained in my Reviewed-by
>comment.

Good to know that, thank you for the info!

Regards,
Fengguang

--===============3354771317227437211==--

