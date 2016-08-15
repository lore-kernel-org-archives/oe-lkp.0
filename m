Content-Type: multipart/mixed; boundary="===============1939515239207811628=="
MIME-Version: 1.0
From: Huang, Ying <ying.huang@intel.com>
To: lkp@lists.01.org
Subject: Re: [xfs] 68a9f5e700: aim7.jobs-per-min -13.6% regression
Date: Mon, 15 Aug 2016 10:22:43 -0700
Message-ID: <87twemndzw.fsf@yhuang-mobile.sh.intel.com>
In-Reply-To: <20160811044609.GW16044@dastard>
List-Id: <oe-lkp.lists.linux.dev>

--===============1939515239207811628==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hi, Chinner,

Dave Chinner <david@fromorbit.com> writes:

> On Wed, Aug 10, 2016 at 06:00:24PM -0700, Linus Torvalds wrote:
>> On Wed, Aug 10, 2016 at 5:33 PM, Huang, Ying <ying.huang@intel.com> wr=
ote:
>> >
>> > Here it is,
>> =

>> Thanks.
>> =

>> Appended is a munged "after" list, with the "before" values in
>> parenthesis. It actually looks fairly similar.
>> =

>> The biggest difference is that we have "mark_page_accessed()" show up
>> after, and not before. There was also a lot of LRU noise in the
>> non-profile data. I wonder if that is the reason here: the old model
>> of using generic_perform_write/block_page_mkwrite didn't mark the
>> pages accessed, and now with iomap_file_buffered_write() they get
>> marked as active and that screws up the LRU list, and makes us not
>> flush out the dirty pages well (because they are seen as active and
>> not good for writeback), and then you get bad memory use.
>> =

>> I'm not seeing anything that looks like locking-related.
>
> Not in that profile. I've been doing some local testing inside a
> 4-node fake-numa 16p/16GB RAM VM to see what I can find.

You run the test in a virtual machine, I think that is why your perf
data looks strange (high value of _raw_spin_unlock_irqrestore).

To setup KVM to use perf, you may refer to,

https://access.redhat.com/documentation/en-US/Red_Hat_Enterprise_Linux/7/ht=
ml/Virtualization_Tuning_and_Optimization_Guide/sect-Virtualization_Tuning_=
Optimization_Guide-Monitoring_Tools-vPMU.html
https://access.redhat.com/documentation/en-US/Red_Hat_Enterprise_Linux/6/ht=
ml/Virtualization_Administration_Guide/sect-perf-mon.html

I haven't tested them.  You may Google to find more information.  Or the
perf/kvm people can give you more information.

> I'm yet to work out how I can trigger a profile like the one that
> was reported (I really need to see the event traces), but in the
> mean time I found this....
>
> Doing a large sequential single threaded buffered write using a 4k
> buffer (so single page per syscall to make the XFS IO path allocator
> behave the same way as in 4.7), I'm seeing a CPU profile that
> indicates we have a potential mapping->tree_lock issue:
>
> # xfs_io -f -c "truncate 0" -c "pwrite 0 47g" /mnt/scratch/fooey
> wrote 50465865728/50465865728 bytes at offset 0
> 47.000 GiB, 12320768 ops; 0:01:36.00 (499.418 MiB/sec and 127850.9132 ops=
/sec)
>
> ....
>
>   24.15%  [kernel]  [k] _raw_spin_unlock_irqrestore
>    9.67%  [kernel]  [k] copy_user_generic_string
>    5.64%  [kernel]  [k] _raw_spin_unlock_irq
>    3.34%  [kernel]  [k] get_page_from_freelist
>    2.57%  [kernel]  [k] mark_page_accessed
>    2.45%  [kernel]  [k] do_raw_spin_lock
>    1.83%  [kernel]  [k] shrink_page_list
>    1.70%  [kernel]  [k] free_hot_cold_page
>    1.26%  [kernel]  [k] xfs_do_writepage

Best Regards,
Huang, Ying

--===============1939515239207811628==--

