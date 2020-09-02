Content-Type: multipart/mixed; boundary="===============4905327987793794978=="
MIME-Version: 1.0
From: Chen, Rong A <rong.a.chen@intel.com>
To: lkp@lists.01.org
Subject: Re: [kthread] 2e7d8748eb: last_state.is_incomplete_run
Date: Wed, 02 Sep 2020 15:53:13 +0800
Message-ID: <dbe28d52-1879-66b7-a490-29fe5e14a703@intel.com>
In-Reply-To: <CAPx_LQGBY-QzXnYMB4zZ=Q5yyRGFF9W68NgB8gqqXchRjUD2WQ@mail.gmail.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============4905327987793794978==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Thanks for the input, we do detect this on this commit but not its parent.
It may be merged into a wrong base branch or something else that
we are not aware of. And it's kind difficulty now for us to provide a
reproduction step for kexec issue, we will consider this further.

Best Regards,
Rong Chen


On 8/27/2020 11:49 AM, qianli zhao wrote:
> I did not see any exceptions related to my changes,the corresponding
> macro CONFIG_DEBUG_OBJECTS_KTHREAD is not enabled,so i think the issue
> has nothing to do with my changes
>
> Thanks
>
> On Thu, 20 Aug 2020 at 14:26, kernel test robot <rong.a.chen@intel.com>=
 wrote:
>> Greeting,
>>
>> FYI, we noticed the following commit (built with gcc-9):
>>
>> commit: 2e7d8748eba7e32150cbd4f57129ea77d1255892 ("[RFC V2] kthread: add=
 object debug support")
>> url: https://github.com/0day-ci/linux/commits/Qianli-Zhao/kthread-add-ob=
ject-debug-support/20200812-131719
>> base: https://git.kernel.org/cgit/linux/kernel/git/torvalds/linux.git fb=
893de323e2d39f7a1f6df425703a2edbdf56ea
>>
>> in testcase: boot
>>
>> on test machine: 8 threads Intel(R) Core(TM) i7-3770K CPU @ 3.50GHz with=
 16G memory
>>
>> caused below changes (please refer to attached dmesg/kmsg for entire log=
/backtrace):
>>
>>
>>
>> kernel boot failed by kexec:
>>
>> user  :notice:  [32m[  +0.371313]  [0m [33mLKP [0m: kexec loading...
>> user  :notice:  [32m[  +0.007118]  [0mkexec --noefi -l /opt/rootfs/tmp/p=
kg/linux/x86_64-rhel-8.3/gcc-9/2e7d8748eba7e32150cbd4f57129ea77d1255892/vml=
inuz-5.8.0-12610-g2e7d8748eba7e --initrd=3D/opt/rootfs/tmp/initrd-concatena=
ted
>>
>>
>>
>>
>> Thanks,
>> Rong Chen
>>

--===============4905327987793794978==--

