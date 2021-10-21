Content-Type: multipart/mixed; boundary="===============2784926192783956360=="
MIME-Version: 1.0
From: Anand Jain <anand.jain@oracle.com>
To: lkp@lists.01.org
Subject: Re: [btrfs] 0f80799866: WARNING:at_fs/sysfs/file.c:#sysfs_emit
Date: Fri, 22 Oct 2021 00:18:37 +0800
Message-ID: <d436f663-2b9b-1625-3de6-1b29130de8bd@oracle.com>
In-Reply-To: <20211021160648.GD20319@twin.jikos.cz>
List-Id: <oe-lkp.lists.linux.dev>

--===============2784926192783956360==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable



On 22/10/2021 00:06, David Sterba wrote:
> On Thu, Oct 21, 2021 at 09:35:38PM +0800, kernel test robot wrote:
>>
>>
>> Greeting,
>>
>> FYI, we noticed the following commit (built with gcc-9):
>>
>> commit: 0f807998661ecadb74638c18cbaff8785bb46f8d ("[PATCH 1/2] btrfs: sy=
sfs convert scnprintf and snprintf to use sysfs_emit")
>> url: https://github.com/0day-ci/linux/commits/Anand-Jain/provide-fsid-in=
-sysfs-devinfo/20211019-082356
>> base: https://git.kernel.org/cgit/linux/kernel/git/kdave/linux.git for-n=
ext
>>
>> in testcase: boot
>>
>> on test machine: qemu-system-i386 -enable-kvm -cpu SandyBridge -smp 2 -m=
 4G
> =

> I wonder if it's related to the 32bit host, I don't see any crash.
> =



We are hitting this warning:

int sysfs_emit(char *buf, const char *fmt, ...)
{
         va_list args;
         int len;

         if (WARN(!buf || offset_in_page(buf),   <=3D=3D=3D=3D
                  "invalid sysfs_emit: buf:%p\n", buf))
                 return 0;
<snip>


The input buf wasn't page-aligned because it wasn't part of the show().
--===============2784926192783956360==--

