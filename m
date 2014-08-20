Content-Type: multipart/mixed; boundary="===============8588574257956188551=="
MIME-Version: 1.0
From: Miao Xie <miaox@cn.fujitsu.com>
To: lkp@lists.01.org
Subject: Re: [btrfs] 8d875f95: xfstests.generic.226.fail
Date: Wed, 20 Aug 2014 18:52:55 +0800
Message-ID: <53F47E07.3080807@cn.fujitsu.com>
In-Reply-To: <53F36601.5020609@fb.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============8588574257956188551==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Tue, 19 Aug 2014 10:58:09 -0400, Chris Mason wrote:
> On 08/19/2014 10:23 AM, David Sterba wrote:
>> On Tue, Aug 19, 2014 at 07:58:20PM +0800, Fengguang Wu wrote:
>>> We noticed an xfstests failure on commit
>>>
>>> 8d875f95da43c6a8f18f77869f2ef26e9594fecc ("btrfs: disable strict file f=
lushes for renames and truncates")
>>>
>>> It's 100% reproducible in the 5 test runs.
>>
>> Same here, different mkfs configurations.
>>
>> generic/226 28s ...    [16:11:52] [16:12:55] - output mismatch (see /roo=
t/xfstests/results//generic/226.out.bad)
>>     --- tests/generic/226.out   2013-05-29 17:16:03.000000000 +0200
>>     +++ /root/xfstests/results//generic/226.out.bad     2014-08-19 16:12=
:55.000000000 +0200
>>     @@ -1,6 +1,8 @@
>>      QA output created by 226
>>      --> mkfs 256m filesystem
>>      --> 16 buffered 64m writes in a loop
>>     -1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16
>>     +1 2 3 4 pwrite64: No space left on device
>>     +5 6 7 8 9 10 11 12 pwrite64: No space left on device
>>     +13 14 15 16
>>
>> enospc on a small filesystem (256M)
> =

> I'm calling filemap flush more often, but otherwise everything else is
> the same.  I'll take a look.

The above patch also introduced a performance regression(~70%DOWN).
We can reproduce this regression by fio, here is the config:

[global]
ioengine=3Dfalloc
iodepth=3D1
direct=3D0
buffered=3D0
directory=3D<mnt>
nrfiles=3D1
filesize=3D100m
group_reporting

[sequential aio-dio write]
stonewall
ioengine=3Dposixaio
numjobs=3D1
iodepth=3D128
buffered=3D0
direct=3D0
rw=3Dwrite
bs=3D64k
filename=3Dfragmented_file

I found the problem is caused by the following function:

int btrfs_release_file(struct inode *inode, struct file *filp)
{
	...
	filemap_flush(inode->i_mapping);
	return 0;
}

I don't think we need flush file at most situation. Ext4 flushes the file o=
nly
after someone truncate the file to be zero-length, I don't know the real re=
ason
why ext4 flush the file only after the file is truncated, someone said it i=
s to
reduce the risk that the users find a zero-length file after a crash, which=
 happens
after truncate-write-close process.

If we change btrfs_release_file by ext4's implementation, both the failure =
of
xfstests's generic/226  and performance regression can be fixed.

Thanks
Miao

> =

> -chris
> --
> To unsubscribe from this list: send the line "unsubscribe linux-kernel" in
> the body of a message to majordomo(a)vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
> Please read the FAQ at  http://www.tux.org/lkml/
> =



--===============8588574257956188551==--

