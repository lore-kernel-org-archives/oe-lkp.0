Content-Type: multipart/mixed; boundary="===============2499052767761721078=="
MIME-Version: 1.0
From: Yujie Liu <yujie.liu@intel.com>
To: lkp@lists.01.org
Subject: Re: [USB] 3a2b1036e8: WARNING:possible_recursive_locking_detected
Date: Thu, 18 Aug 2022 14:07:10 +0800
Message-ID: <8f500c8c-c0a1-7825-a70d-3c2690fee18b@intel.com>
In-Reply-To: <Yv1jFcPocWBkgL4v@rowland.harvard.edu>
List-Id: <oe-lkp.lists.linux.dev>

--===============2499052767761721078==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On 8/18/2022 05:52, Alan Stern wrote:
> On Wed, Aug 17, 2022 at 04:43:01PM +0800, kernel test robot wrote:
>> Greeting,
>>
>> FYI, we noticed the following commit (built with gcc-11):
>>
>> commit: 3a2b1036e8951328b7e59517408897c700a74871 ("USB: gadget: Fix use-=
after-free Read in usb_udc_uevent()")
>> https://git.kernel.org/cgit/linux/kernel/git/stable/linux-stable-rc.git =
linux-5.4.y
> =

> How did you come by that combination?  The "USB: gadget: Fix
> use-after-free Read in usb_udc_uevent()" patch is not supposed to be
> applied to the 5.4.y kernel series.  It is only supposed to be applied
> to kernels which have [a backported version of] commit fc274c1e9973
> ("USB: gadget: Add a new bus for gadgets").
> =

> It's not surprising that you found an issue, applying that patch to a
> kernel where it doesn't belong.

We happened to catch a v5.4.211-rc1 patch series yesterday, and it does
include the "USB: gadget: Fix use-after-free Read in usb_udc_uevent()" patc=
h.
But now the head of linux-stable-rc/linux-5.4.y branch has been rebased to
v5.4.210.


da19aaf18f551 Linux 5.4.211-rc1
...
3a2b1036e8951 USB: gadget: Fix use-after-free Read in usb_udc_uevent()
...
de0cd3ea700d1 (tag: v5.4.210, linux-stable-rc/linux-5.4.y) Linux 5.4.210


Looks like we have some delay when updating the latest state of this tree.
Sorry for this false report, we'll update our workflow to avoid similar
cases in the future.

Best Regards,
Yujie
--===============2499052767761721078==--

