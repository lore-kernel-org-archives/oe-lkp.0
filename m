Content-Type: multipart/mixed; boundary="===============2934461647656903144=="
MIME-Version: 1.0
From: Qu Wenruo <quwenruo.btrfs@gmx.com>
To: lkp@lists.01.org
Subject: Re: [btrfs] dae7bf275f: last_state.incomplete
Date: Tue, 15 Feb 2022 20:32:20 +0800
Message-ID: <37c59b99-bd45-c017-6d2b-ff9b7a7fc1af@gmx.com>
In-Reply-To: <5dc2fd83-5c87-4ec7-2b2a-3eb6a48b7186@gmx.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============2934461647656903144==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable



On 2022/2/15 20:25, Qu Wenruo wrote:
>
>
> On 2022/2/15 20:05, David Sterba wrote:
>> On Tue, Feb 15, 2022 at 03:20:54PM +0800, kernel test robot wrote:
>>> If you fix the issue, kindly add following tag
>>> Reported-by: kernel test robot <oliver.sang@intel.com>
>>>
>>>
>>> the test's last state 'incomplete' seems be caused by below error
>>> (detail
>>> in attached dmesg.xz)
>>>
>>> [=C2=A0=C2=A0 49.293458][ T3822] BTRFS info (device sdb3): flagging fs =
with big
>>> metadata feature
>>> [=C2=A0=C2=A0 49.301630][ T3822] BTRFS info (device sdb3): disk space c=
aching
>>> is enabled
>>> [=C2=A0=C2=A0 49.309039][ T3822] BTRFS info (device sdb3): has skinny e=
xtents
>>> [=C2=A0=C2=A0 49.320312][ T3822] BTRFS error (device sdb3): invalid num=
ber of
>>> stripes 0 in sys_array at offset 17
>
> The offset is just one key, so we're reading the first chunk item in sys
> chunk array.
>
> If you guys can reproduce the situation, please provide the dump of sdb3
> by:
>
> # btrfs ins dump-super -fFa /dev/sdb3

No need, your fs should be completely sane.

>
>
> A quick glance gives me some concern, as for super block sys chunk
> array, we're not doing the proper extent buffer thing, but a dummy/fake
> extent buffer just to get the extent buffer accessors.
>
> Thus some get_**bits function may return false 0 and cause the problem.
>
> I'll try to reproduce and hopefully fix it.

It's the condition, completely opposite:

-       ASSERT(check_setget_bounds(token->eb, ptr, off, size));         \
+       if (check_setget_bounds(token->eb, ptr, off, size))             \
+               return 0;

check_setget_bounds() return true if nothing is wrong.

Now we're already returning 0 for any bit read, and never write any data
for any bit write...

No wonder we got num_stripes as 0, as that's the first thing we really
check from super block...

Thanks,
Qu

>
> Thanks,
> Qu
>>> [=C2=A0=C2=A0 49.329910][ T3822] BTRFS error (device sdb3): failed to r=
ead the
>>> system array: -5
>>> [=C2=A0=C2=A0 49.346302][ T3822] BTRFS error (device sdb3): open_ctree =
failed
>>
>> Seems that your setup has some problems with creating/using valid
>> filesystems. It's reported on a patch that moves a sanity check from an
>> ASSERT, and your kernel is not built with asserts enabled so it actually
>> started to test more things.
>>
>>> CONFIG_BTRFS_FS=3Dm
>>> CONFIG_BTRFS_FS_POSIX_ACL=3Dy
>>> # CONFIG_BTRFS_FS_CHECK_INTEGRITY is not set
>>> # CONFIG_BTRFS_FS_RUN_SANITY_TESTS is not set
>>> # CONFIG_BTRFS_DEBUG is not set
>>> # CONFIG_BTRFS_ASSERT is not set
>>
>> Not set before, now it is. You may want to enable this to see if there
>> are more problems reported. It can be one time or enabled for all
>> testing, the assertions should be lightweight enough for that (compared
>> to CONFIG_BTRFS_DEBUG).
>>
>>> # CONFIG_BTRFS_FS_REF_VERIFY is not set
--===============2934461647656903144==--

