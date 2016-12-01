Content-Type: multipart/mixed; boundary="===============4932170010791022830=="
MIME-Version: 1.0
From: Ye Xiaolong <xiaolong.ye@intel.com>
To: lkp@lists.01.org
Subject: Re: [x86, paravirt] fd6f48529f: aim7.jobs-per-min -26.1% regression
Date: Fri, 02 Dec 2016 00:49:29 +0800
Message-ID: <20161201164929.GB31607@yexl-desktop>
In-Reply-To: <20161130231758.GB18574@yexl-desktop>
List-Id: <oe-lkp.lists.linux.dev>

--===============4932170010791022830==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On 12/01, Ye Xiaolong wrote:
>On 12/01, Peter Zijlstra wrote:
>>On Thu, Dec 01, 2016 at 02:07:29AM +0800, kernel test robot wrote:
>>> =

>>> Greeting,
>>> =

>>> FYI, we noticed a -26.1% regression of aim7.jobs-per-min due to commit:
>>> =

>>> =

>>> commit: fd6f48529f4067c6bfbead88d3d7d117d51150f6 ("x86,paravirt: Optimi=
ze native pv_lock_ops.vcpu_is_preempted")
>>> https://git.kernel.org/pub/scm/linux/kernel/git/peterz/queue.git lockin=
g/core
>>> =

>>
>>> =

>>> 8ba24710fb279053  fd6f48529f4067c6bfbead88d3  =

>>
>>So that really is against its parent..

I applied the fix patch on top of commit fd6f485 ("x86,paravirt:
Optimize native pv_lock_ops.vcpu_is_preempted"), and here is the
comparison, seems it doesn't help restore the performance back.
(b5bd458372ccfb4c42ba3cf4d2 is the commit id for fix patch).


$ compare -aPt 8ba24710fb279053bb19e39e454fea42d0e76711  fd6f48529f4067c6bf=
bead88d3d7d117d51150f6 b5bd458372ccfb4c42ba3cf4d2aad3376a2198d8            =
                                                                           =
                                          [12/1734]
tests: 3
testcase/path_params/tbox_group/run: aim7/link_test-2000/vm-lkp-a05

8ba24710fb279053  fd6f48529f4067c6bfbead88d3  b5bd458372ccfb4c42ba3cf4d2  =

----------------  --------------------------  --------------------------  =

         %stddev      change         %stddev      change         %stddev
             \          |                \          |                \  =

      9147 =C2=B1  3%       -26%       6763 =C2=B1  3%       -27%       667=
9 =C2=B1  4%  aim7.jobs-per-min
    560854              59%     891815 =C2=B1  9%        68%     942907 =C2=
=B1  5%  aim7.time.voluntary_context_switches
      1329 =C2=B1  3%        35%       1792 =C2=B1  3%        37%       181=
5 =C2=B1  4%  aim7.time.elapsed_time
      1329 =C2=B1  3%        35%       1792 =C2=B1  3%        37%       181=
5 =C2=B1  4%  aim7.time.elapsed_time.max
      2594 =C2=B1  4%        29%       3349 =C2=B1  3%        28%       333=
1 =C2=B1  5%  aim7.time.user_time
      1625              12%       1821 =C2=B1  4%        10%       1790    =
    aim7.time.system_time
      3189              -6%       2988              -7%       2976        v=
mstat.system.cs
      5534              -6%       5183              -8%       5117        v=
mstat.system.in
    143117 =C2=B1123%     -1e+05      11061 =C2=B1173%      5e+05     61121=
9 =C2=B1121%  latency_stats.avg.nfs_wait_on_request.nfs_writepage_setup.nfs=
_updatepage.nfs_write_end.generic_perform_write.nfs_file_write.__vfs_write.=
vfs_write.SyS_write.entry_SYSCALL_64_fastpath
         0                0          0            1e+04      10432 =C2=B110=
0%  latency_stats.avg.call_rwsem_down_read_failed.environ_read.__vfs_read.v=
fs_read.SyS_read.entry_SYSCALL_64_fastpath
     12154 =C2=B1118%     -1e+04       1682 =C2=B1 40%     -1e+04       134=
4 =C2=B1 40%  latency_stats.avg.call_rwsem_down_write_failed.copy_process._=
do_fork.SyS_clone.do_syscall_64.return_from_SYSCALL_64
     14029 =C2=B1 12%     -1e+04        390 =C2=B1 59%     -1e+04        99=
6 =C2=B1 97%  latency_stats.avg.pipe_read.__vfs_read.vfs_read.SyS_read.entr=
y_SYSCALL_64_fastpath
     17531 =C2=B1 84%     -2e+04       2189 =C2=B1 77%     -2e+04       234=
0 =C2=B1 30%  latency_stats.avg.call_rwsem_down_write_failed.__vma_adjust._=
_split_vma.split_vma.mprotect_fixup.do_mprotect_pkey.SyS_mprotect.entry_SYS=
CALL_64_fastpath
     20760 =C2=B1 84%     -2e+04       2731 =C2=B1 89%     -2e+04       193=
8 =C2=B1 77%  latency_stats.avg.call_rwsem_down_write_failed.unlink_file_vm=
a.free_pgtables.exit_mmap.mmput.flush_old_exec.load_elf_binary.search_binar=
y_handler.do_execveat_common.SyS_execve.do_syscall_64.return_from_
SYSCALL_64
    145833 =C2=B1120%     -1e+05      14303 =C2=B1173%      1e+06    152062=
7 =C2=B1152%  latency_stats.max.nfs_wait_on_request.nfs_writepage_setup.nfs=
_updatepage.nfs_write_end.generic_perform_write.nfs_file_write.__vfs_write.=
vfs_write.SyS_write.entry_SYSCALL_64_fastpath
     99771 =C2=B1 25%     -5e+04      53493 =C2=B1 45%      1e+06    112701=
0 =C2=B1166%  latency_stats.max.pipe_read.__vfs_read.vfs_read.SyS_read.entr=
y_SYSCALL_64_fastpath
         0                0          0            1e+04      10432 =C2=B110=
0%  latency_stats.max.call_rwsem_down_read_failed.environ_read.__vfs_read.v=
fs_read.SyS_read.entry_SYSCALL_64_fastpath
      8848 =C2=B1 91%     -8e+03        931 =C2=B1 84%     -7e+03       141=
3 =C2=B1 73%  latency_stats.max.rpc_wait_bit_killable.__rpc_execute.rpc_exe=
cute.rpc_run_task.nfs4_call_sync_sequence.[nfsv4]._nfs4_proc_getattr.[nfsv4=
].nfs4_proc_getattr.[nfsv4].__nfs_revalidate_inode.nfs_do_access.n
fs_permission.__inode_permission.inode_permission
    317533 =C2=B1 29%      2e+06    2166387 =C2=B1 17%      2e+06    217023=
1 =C2=B1  3%  latency_stats.sum.pipe_write.__vfs_write.vfs_write.SyS_write.=
entry_SYSCALL_64_fastpath
    581834 =C2=B1  9%      6e+04     640158 =C2=B1 23%      2e+06    220174=
0 =C2=B1114%  latency_stats.sum.pipe_read.__vfs_read.vfs_read.SyS_read.entr=
y_SYSCALL_64_fastpath
    162947 =C2=B1103%     -1e+05      22122 =C2=B1173%      1e+06    155200=
2 =C2=B1152%  latency_stats.sum.nfs_wait_on_request.nfs_writepage_setup.nfs=
_updatepage.nfs_write_end.generic_perform_write.nfs_file_write.__vfs_write.=
vfs_write.SyS_write.entry_SYSCALL_64_fastpath
    203180 =C2=B1 61%     -4e+04     162284 =C2=B1  9%      3e+05     54991=
0 =C2=B1129%  latency_stats.sum.wait_on_page_bit_killable.__lock_page_or_re=
try.filemap_fault.__do_fault.handle_mm_fault.__do_page_fault.trace_do_page_=
fault.do_async_page_fault.async_page_fault

Thanks,
Xiaolong
>>
>>Does something like so fix it?
>
>I'll queue the test job for below patch and provide the result later.
>
>Thanks,
>Xiaolong
>>
>>--- a/arch/x86/kernel/paravirt_patch_32.c
>>+++ b/arch/x86/kernel/paravirt_patch_32.c
>>@@ -56,15 +56,19 @@ unsigned native_patch(u8 type, u16 clobb
>> 				end   =3D end_pv_lock_ops_queued_spin_unlock;
>> 				goto patch_site;
>> 			}
>>+			goto patch_default;
>>+
>> 		case PARAVIRT_PATCH(pv_lock_ops.vcpu_is_preempted):
>> 			if (pv_is_native_vcpu_is_preempted()) {
>> 				start =3D start_pv_lock_ops_vcpu_is_preempted;
>> 				end   =3D end_pv_lock_ops_vcpu_is_preempted;
>> 				goto patch_site;
>> 			}
>>+			goto patch_default;
>> #endif
>> =

>> 	default:
>>+patch_default:
>> 		ret =3D paravirt_patch_default(type, clobbers, ibuf, addr, len);
>> 		break;
>> =

>>--- a/arch/x86/kernel/paravirt_patch_64.c
>>+++ b/arch/x86/kernel/paravirt_patch_64.c
>>@@ -68,15 +68,19 @@ unsigned native_patch(u8 type, u16 clobb
>> 				end   =3D end_pv_lock_ops_queued_spin_unlock;
>> 				goto patch_site;
>> 			}
>>+			goto patch_default;
>>+
>> 		case PARAVIRT_PATCH(pv_lock_ops.vcpu_is_preempted):
>> 			if (pv_is_native_vcpu_is_preempted()) {
>> 				start =3D start_pv_lock_ops_vcpu_is_preempted;
>> 				end   =3D end_pv_lock_ops_vcpu_is_preempted;
>> 				goto patch_site;
>> 			}
>>+			goto patch_default;
>> #endif
>> =

>> 	default:
>>+patch_default:
>> 		ret =3D paravirt_patch_default(type, clobbers, ibuf, addr, len);
>> 		break;
>> =

>>
>_______________________________________________
>LKP mailing list
>LKP(a)lists.01.org
>https://lists.01.org/mailman/listinfo/lkp

--===============4932170010791022830==--

