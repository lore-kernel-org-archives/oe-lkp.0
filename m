Content-Type: multipart/mixed; boundary="===============1132020972004383973=="
MIME-Version: 1.0
From: Fengguang Wu <fengguang.wu@intel.com>
To: lkp@lists.01.org
Subject: Re: [lkp-robot] [bisect done] e71e836f46 [ 17.567570] WARNING: CPU: 0 PID: 1 at arch/x86/include/asm/pgtable.h:540 __change_page_attr_set_clr
Date: Wed, 11 Apr 2018 08:35:53 +0800
Message-ID: <20180411003553.jtmydjialbbgb6hx@wfg-t540p.sh.intel.com>
In-Reply-To: <8b734592-0973-b8e3-a1a7-229cdcd8a529@linux.intel.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============1132020972004383973==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hi Dave,

On Tue, Apr 10, 2018 at 01:59:21PM -0700, Dave Hansen wrote:
>On 04/09/2018 06:12 PM, kernel test robot wrote:
>> +-----------------------------------------------------------------------=
+------------+------------+------------+------------+
>> |                                                                       =
| 64c8075940 | e71e836f46 | 0564258fb2 | 87e1e2f51c |
>> +-----------------------------------------------------------------------=
+------------+------------+------------+------------+
>> | boot_successes                                                        =
| 35         | 0          | 19         | 11         |
>> | boot_failures                                                         =
| 0          | 26         |            |            |
>> | WARNING:at_arch/x86/include/asm/pgtable.h:#__change_page_attr_set_clr =
| 0          | 26         |            |            |
>> | RIP:__change_page_attr_set_clr                                        =
| 0          | 26         |            |            |
>> +-----------------------------------------------------------------------=
+------------+------------+------------+------------+
>
>LKP folks, does this mean that the system didn't boot in all the places
>that we saw this warning?  Or does this just say that it *had* the
>warning 26 times?

The 'e71e836f46' column means there are 0 boots (sorry boot_successes
might be a bit confusing) with clean dmesg and 26 boots with
warning/error dmesg. It indicates that WARNING is 100% reproducible.

        boot_successes + boot_failures =3D total test boots

>I looked into this a bit.  This LKP report points the finger at this
>commit which trips over a new debugging WARN_ON() I added:
>
>[patch 06/11] x86/mm: Remove extra filtering in pageattr code
>
>It's because set_memory_nx() encounters the (unsupported) _PAGE_GLOBAL
>bit while clearing _PAGE_NX.  I never saw this in testing because this
>patch:
>
>[PATCH 10/11] x86/pti: never implicitly clear _PAGE_GLOBAL for kernel image
>
>explicitly clears out _PAGE_GLOBAL long before the set_memory_nx() call.
>So I *think* this is a transient issue resulting in bad ordering of the
>_PAGE_GLOBAL patch set.  I believe it is harmless.

Right. The '0564258fb2' and '87e1e2f51c' columns mean the
'tip/x86/pti' and 'tip/master' branch HEADs boot clean.
So it's a transient warning inside the branch.

Thanks,
Fengguang

--===============1132020972004383973==--

