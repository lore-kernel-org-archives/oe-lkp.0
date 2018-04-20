Content-Type: multipart/mixed; boundary="===============2206349480241573911=="
MIME-Version: 1.0
From: Fengguang Wu <fengguang.wu@intel.com>
To: lkp@lists.01.org
Subject: Re: [gcov_module_notifier] WARNING: CPU: 0 PID: 155 at mm/slab_common.c:996 kmalloc_slab+0x1f/0x79
Date: Fri, 20 Apr 2018 20:38:52 +0800
Message-ID: <20180420123852.ox5xcmwgj4krzapf@wfg-t540p.sh.intel.com>
In-Reply-To: <4e2d71d1-e945-e2c3-cf8f-e19df52df6f5@linux.ibm.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============2206349480241573911==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hi Peter,

On Fri, Apr 20, 2018 at 01:08:07PM +0200, Peter Oberparleiter wrote:
>On 19.04.2018 04:58, Fengguang Wu wrote:
>> FYI this happens in mainline kernel 4.17.0-rc1.
>> It at least dates back to v4.5 .
>
>This is likely the result of compiling the kernel with GCC 7 while
>specifying that gcov-kernel should expect GCC <=3D 3.4 format data:
>
>dmesg:
>> (gcc version 7.3.0 (Debian 7.3.0-1)) #31 Mon Apr 16 23:17:50 CST 2018
>
>.config:
>> # CONFIG_GCOV_FORMAT_AUTODETECT is not set
>> CONFIG_GCOV_FORMAT_3_4=3Dy
>> # CONFIG_GCOV_FORMAT_4_7 is not set
>
>As such, it is an expected test failure. Assuming that this is a
>randconfig test, my recommendation would be to blacklist
>"CONFIG_GCOV_FORMAT_3_4=3Dy" when using GCC >3.4.

Ah OK, thanks! It looks easy to fix for us. Interestingly there's
the default GCOV_FORMAT_AUTODETECT option, however the randconfig
test obviously (blindly) will try other options if ever they are
selectable.

Thanks,
Fengguang

--===============2206349480241573911==--

