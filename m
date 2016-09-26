Content-Type: multipart/mixed; boundary="===============7327607607988563365=="
MIME-Version: 1.0
From: Huang, Ying <ying.huang@linux.intel.com>
To: lkp@lists.01.org
Subject: Re: [xfs] 68a9f5e700: aim7.jobs-per-min -13.6% regression
Date: Mon, 26 Sep 2016 14:25:11 +0800
Message-ID: <87k2dzi3eg.fsf@yhuang-dev.intel.com>
In-Reply-To: <87a8g4ihg7.fsf@yhuang-mobile.sh.intel.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============7327607607988563365==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hi, Christoph,

"Huang, Ying" <ying.huang@intel.com> writes:

> Hi, Christoph,
>
> "Huang, Ying" <ying.huang@intel.com> writes:
>
>> Christoph Hellwig <hch@lst.de> writes:
>>
>>> Snipping the long contest:
>>>
>>> I think there are three observations here:
>>>
>>>  (1) removing the mark_page_accessed (which is the only significant
>>>      change in the parent commit)  hurts the
>>>      aim7/1BRD_48G-xfs-disk_rr-3000-performance/ivb44 test.
>>>      I'd still rather stick to the filemap version and let the
>>>      VM people sort it out.  How do the numbers for this test
>>>      look for XFS vs say ext4 and btrfs?
>>>  (2) lots of additional spinlock contention in the new case.  A quick
>>>      check shows that I fat-fingered my rewrite so that we do
>>>      the xfs_inode_set_eofblocks_tag call now for the pure lookup
>>>      case, and pretty much all new cycles come from that.
>>>  (3) Boy, are those xfs_inode_set_eofblocks_tag calls expensive, and
>>>      we're already doing way to many even without my little bug above.
>>>
>>> So I've force pushed a new version of the iomap-fixes branch with
>>> (2) fixed, and also a little patch to xfs_inode_set_eofblocks_tag a
>>> lot less expensive slotted in before that.  Would be good to see
>>> the numbers with that.
>>
>> For the original reported regression, the test result is as follow,
>>
>> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>> compiler/cpufreq_governor/debug-setup/disk/fs/kconfig/load/rootfs/tbox_g=
roup/test/testcase:
>>   gcc-6/performance/profile/1BRD_48G/xfs/x86_64-rhel/3000/debian-x86_64-=
2015-02-07.cgz/ivb44/disk_wrt/aim7
>>
>> commit: =

>>   f0c6bcba74ac51cb77aadb33ad35cb2dc1ad1506 (parent of first bad commit)
>>   68a9f5e7007c1afa2cf6830b690a90d0187c0684 (first bad commit)
>>   99091700659f4df965e138b38b4fa26a29b7eade (base of your fixes branch)
>>   bf4dc6e4ecc2a3d042029319bc8cd4204c185610 (head of your fixes branch)
>>
>> f0c6bcba74ac51cb 68a9f5e7007c1afa2cf6830b69 99091700659f4df965e138b38b b=
f4dc6e4ecc2a3d042029319bc =

>> ---------------- -------------------------- -------------------------- -=
------------------------- =

>>          %stddev     %change         %stddev     %change         %stddev=
     %change         %stddev
>>              \          |                \          |                \  =
        |                \  =

>>     484435 =C2=B1  0%     -13.3%     420004 =C2=B1  0%     -17.0%     40=
2250 =C2=B1  0%     -15.6%     408998 =C2=B1  0%  aim7.jobs-per-min
>
> It appears the original reported regression hasn't bee resolved by your
> commit.  Could you take a look at the test results and the perf data?

Any update to this regression?

Best Regards,
Huang, Ying

>>
>> And the perf data is as follow,
>>
>>   "perf-profile.func.cycles-pp.intel_idle": 20.25,
>>   "perf-profile.func.cycles-pp.memset_erms": 11.72,
>>   "perf-profile.func.cycles-pp.copy_user_enhanced_fast_string": 8.37,
>>   "perf-profile.func.cycles-pp.__block_commit_write.isra.21": 3.49,
>>   "perf-profile.func.cycles-pp.block_write_end": 1.77,
>>   "perf-profile.func.cycles-pp.native_queued_spin_lock_slowpath": 1.63,
>>   "perf-profile.func.cycles-pp.unlock_page": 1.58,
>>   "perf-profile.func.cycles-pp.___might_sleep": 1.56,
>>   "perf-profile.func.cycles-pp.__block_write_begin_int": 1.33,
>>   "perf-profile.func.cycles-pp.iov_iter_copy_from_user_atomic": 1.23,
>>   "perf-profile.func.cycles-pp.up_write": 1.21,
>>   "perf-profile.func.cycles-pp.__mark_inode_dirty": 1.18,
>>   "perf-profile.func.cycles-pp.down_write": 1.06,
>>   "perf-profile.func.cycles-pp.mark_buffer_dirty": 0.94,
>>   "perf-profile.func.cycles-pp.generic_write_end": 0.92,
>>   "perf-profile.func.cycles-pp.__radix_tree_lookup": 0.91,
>>   "perf-profile.func.cycles-pp._raw_spin_lock": 0.81,
>>   "perf-profile.func.cycles-pp.entry_SYSCALL_64_fastpath": 0.79,
>>   "perf-profile.func.cycles-pp.__might_sleep": 0.79,
>>   "perf-profile.func.cycles-pp.xfs_file_iomap_begin_delay.isra.9": 0.7,
>>   "perf-profile.func.cycles-pp.__list_del_entry": 0.7,
>>   "perf-profile.func.cycles-pp.vfs_write": 0.69,
>>   "perf-profile.func.cycles-pp.drop_buffers": 0.68,
>>   "perf-profile.func.cycles-pp.xfs_file_write_iter": 0.67,
>>   "perf-profile.func.cycles-pp.rwsem_spin_on_owner": 0.67,
>>
>> Best Regards,
>> Huang, Ying
>> _______________________________________________
>> LKP mailing list
>> LKP(a)lists.01.org
>> https://lists.01.org/mailman/listinfo/lkp

--===============7327607607988563365==--

