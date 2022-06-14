Content-Type: multipart/mixed; boundary="===============9115636319564170440=="
MIME-Version: 1.0
From: Yin Fengwei <fengwei.yin@intel.com>
To: lkp@lists.01.org
Subject: Re: [io_uring] 584b0180f0: phoronix-test-suite.fio.SequentialWrite.IO_uring.Yes.Yes.1MB.DefaultTestDirectory.mb_s -10.2% regression
Date: Tue, 14 Jun 2022 09:54:05 +0800
Message-ID: <2f623c4c-1837-4943-763c-d9b57e8cca95@intel.com>
In-Reply-To: <2085bfef-a91c-8adb-402b-242e8c5d5c55@kernel.dk>
List-Id: <oe-lkp.lists.linux.dev>

--===============9115636319564170440==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable


On 5/27/2022 9:50 PM, Jens Axboe wrote:
> On 5/27/22 3:24 AM, kernel test robot wrote:
>>
>>
>> Greeting,
>>
>> FYI, we noticed a -10.2% regression of phoronix-test-suite.fio.Sequentia=
lWrite.IO_uring.Yes.Yes.1MB.DefaultTestDirectory.mb_s due to commit:
>>
>>
>> commit: 584b0180f0f4d67d7145950fe68c625f06c88b10 ("io_uring: move read/w=
rite file prep state into actual opcode handler")
>> https://git.kernel.org/cgit/linux/kernel/git/torvalds/linux.git master
>>
>> in testcase: phoronix-test-suite
>> on test machine: 96 threads 2 sockets Intel(R) Xeon(R) Gold 6252 CPU @ 2=
.10GHz with 512G memory
>> with following parameters:
>>
>> 	test: fio-1.14.1
>> 	option_a: Sequential Write
>> 	option_b: IO_uring
>> 	option_c: Yes
>> 	option_d: Yes
>> 	option_e: 1MB
>> 	option_f: Default Test Directory
>> 	cpufreq_governor: performance
>> 	ucode: 0x500320a
>>
>> test-description: The Phoronix Test Suite is the most comprehensive test=
ing and benchmarking platform available that provides an extensible framewo=
rk for which new tests can be easily added.
>> test-url: http://www.phoronix-test-suite.com/
> =

> I'm a bit skeptical on this, but I'd like to try and run the test case.
> Since it's just a fio test case, why can't I find it somewhere? Seems
> very convoluted to have to setup lkp-tests just for this. Besides, I
> tried, but it doesn't work on aarch64...
> =

We re-run the test and still could get exactly same test result. We noticed
following info from perf profile:

     14.40 =C2=B1 21%     +71.3       85.71 =C2=B1  2%  perf-profile.calltr=
ace.cycles-pp.io_wqe_worker.ret_from_fork
     14.25 =C2=B1 21%     +71.4       85.64 =C2=B1  2%  perf-profile.calltr=
ace.cycles-pp.io_worker_handle_work.io_wqe_worker.ret_from_fork
     14.23 =C2=B1 21%     +71.4       85.63 =C2=B1  2%  perf-profile.calltr=
ace.cycles-pp.io_issue_sqe.io_wq_submit_work.io_worker_handle_work.io_wqe_w=
orker.ret_from_fork
     14.23 =C2=B1 21%     +71.4       85.64 =C2=B1  2%  perf-profile.calltr=
ace.cycles-pp.io_wq_submit_work.io_worker_handle_work.io_wqe_worker.ret_fro=
m_fork
     14.22 =C2=B1 21%     +71.4       85.63 =C2=B1  2%  perf-profile.calltr=
ace.cycles-pp.io_write.io_issue_sqe.io_wq_submit_work.io_worker_handle_work=
.io_wqe_worker
     14.10 =C2=B1 21%     +71.5       85.62 =C2=B1  2%  perf-profile.calltr=
ace.cycles-pp.ext4_buffered_write_iter.io_write.io_issue_sqe.io_wq_submit_w=
ork.io_worker_handle_work
      0.00           +80.9       80.92 =C2=B1  2%  perf-profile.calltrace.c=
ycles-pp.osq_lock.rwsem_optimistic_spin.rwsem_down_write_slowpath.ext4_buff=
ered_write_iter.io_write
      0.00           +83.0       82.99 =C2=B1  2%  perf-profile.calltrace.c=
ycles-pp.rwsem_optimistic_spin.rwsem_down_write_slowpath.ext4_buffered_writ=
e_iter.io_write.io_issue_sqe
      0.00           +83.6       83.63 =C2=B1  2%  perf-profile.calltrace.c=
ycles-pp.rwsem_down_write_slowpath.ext4_buffered_write_iter.io_write.io_iss=
ue_sqe.io_wq_submit_work

The above operations takes more time with the patch applied.
It looks like the inode lock contention raised a lot with
the patch.

Frankly, we can't connect this behavior with the patch. Just
list here for your information. Thanks.


Regards
Yin, Fengwei
--===============9115636319564170440==--

