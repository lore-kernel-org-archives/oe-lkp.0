Content-Type: multipart/mixed; boundary="===============0800954136701624496=="
MIME-Version: 1.0
From: Weichao Guo <guoweichao@oppo.com>
To: lkp@lists.01.org
Subject: Re: [LTP] [f2fs] 02eb84b96b: ltp.swapon03.fail
Date: Thu, 29 Apr 2021 21:08:42 +0800
Message-ID: <cf28837a-9558-b00c-bca3-601a70b752ea@oppo.com>
In-Reply-To: <e2009f2d-253d-264c-53ca-fa644897a952@huawei.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============0800954136701624496==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable


On 2021/3/23 17:04, Chao Yu wrote:
> On 2021/3/11 4:49, Jaegeuk Kim wrote:
>> On 03/10, Huang Jianan wrote:
>>> Hi Richard,
>>>
>>> On 2021/3/9 12:01, Matthew Wilcox wrote:
>>>> On Tue, Mar 09, 2021 at 10:23:35AM +0800, Weichao Guo wrote:
>>>>> Hi Richard,
>>>>>
>>>>> On 2021/3/8 19:53, Richard Palethorpe wrote:
>>>>>> Hello,
>>>>>>
>>>>>>> kern=C2=A0 :err=C2=A0=C2=A0 : [=C2=A0 187.461914] F2FS-fs (sda1): S=
wapfile does not =

>>>>>>> align to section
>>>>>>> commit 02eb84b96bc1b382dd138bf60724edbefe77b025
>>>>>>> Author: huangjianan(a)oppo.com <huangjianan@oppo.com>
>>>>>>> Date:=C2=A0=C2=A0 Mon Mar 1 12:58:44 2021 +0800
>>>>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 f2fs: check if swapfile is sec=
tion-alligned
>>>>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 If the swapfile isn't created =
by pin and fallocate, it =

>>>>>>> can't be
>>>>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 guaranteed section-aligned, so=
 it may be selected by f2fs =

>>>>>>> gc. When
>>>>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 gc_pin_file_threshold is reach=
ed, the address of swapfile =

>>>>>>> may change,
>>>>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 but won't be synchronized to s=
wap_extent, so swap will =

>>>>>>> write to wrong
>>>>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 address, which will cause data=
 corruption.
>>>>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Signed-off-by: Huang Jianan <h=
uangjianan@oppo.com>
>>>>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Signed-off-by: Guo Weichao <gu=
oweichao@oppo.com>
>>>>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Reviewed-by: Chao Yu <yuchao0(=
a)huawei.com>
>>>>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Signed-off-by: Jaegeuk Kim <ja=
egeuk@kernel.org>
>>>>>> The test uses fallocate to preallocate the swap file and writes =

>>>>>> zeros to
>>>>>> it. I'm not sure what pin refers to?
>>>>> 'pin' refers to pinned file feature in F2FS, the LBA(Logical Block =

>>>>> Address)
>>>>> of a file is fixed after pinned. Without this operation before =

>>>>> fallocate,
>>>>> the LBA may not align with section(F2FS GC unit), some LBA of the =

>>>>> file may
>>>>> be changed by F2FS GC in some extreme cases.
>>>>>
>>>>> For this test case, how about pin the swap file before fallocate =

>>>>> for F2FS as
>>>>> following:
>>>>>
>>>>> ioctl(fd, F2FS_IOC_SET_PIN_FILE, true);
>>>> No special ioctl should be needed.=C2=A0 f2fs_swap_activate() should p=
in =

>>>> the
>>>> file, just like it converts inline inodes and disables compression.
>>>
>>> Now f2fs_swap_activate() will pin the file. The problem is that when
>>> f2fs_swap_activate()
>>>
>>> is executed, the file has been created and may not be section-aligned.
>>>
>>> So I think it would be better to consider aligning the swapfile during
>>> f2fs_swap_activate()?
>>
>> Does it make sense to reallocate blocks like
>> in f2fs_swap_activate(),
>> =C2=A0=C2=A0=C2=A0=C2=A0set_inode_flag(inode, FI_PIN_FILE);
>> =C2=A0=C2=A0=C2=A0=C2=A0truncate_pagecache(inode, 0);
>> =C2=A0=C2=A0=C2=A0=C2=A0f2fs_truncate_blocks(inode, 0, true);
>
> It will corrupt swap header info while relocating whole swapfile...
How about back up the header page, and recover it after =

expand_inode_data() ?
>
>> =C2=A0=C2=A0=C2=A0=C2=A0expand_inode_data();
>> .
>>
--===============0800954136701624496==--

