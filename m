Content-Type: multipart/mixed; boundary="===============2623215633316760868=="
MIME-Version: 1.0
From: Chandan Babu R <chandan.babu@oracle.com>
To: lkp@lists.01.org
Subject: Re: [xfs] 83a21c1844: xfstests.xfs.533.fail
Date: Fri, 06 May 2022 15:30:29 +0530
Message-ID: <87tua3ou9u.fsf@debian-BULLSEYE-live-builder-AMD64>
In-Reply-To: <YnTcP86M0NV6lkfB@rh>
List-Id: <oe-lkp.lists.linux.dev>

--===============2623215633316760868==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On 06 May 2022 at 13:58, Dave Chinner wrote:
> On Fri, May 06, 2022 at 04:03:41PM +0800, kernel test robot wrote:
>> =

>> =

>> Greeting,
>> =

>> FYI, we noticed the following commit (built with gcc-11):
>> =

>> commit: 83a21c18441f75aec64548692b52d34582b98a6a ("xfs: Directory's data=
 fork extent counter can never overflow")
>> https://git.kernel.org/cgit/linux/kernel/git/next/linux-next.git master
>> =

>> in testcase: xfstests
>> version: xfstests-x86_64-46e1b83-1_20220414
>> with following parameters:
>> =

>> 	disk: 4HDD
>> 	fs: xfs
>> 	test: xfs-group-53
>> 	ucode: 0x21
>> =

>> test-description: xfstests is a regression test suite for xfs and other =
files ystems.
>> test-url: git://git.kernel.org/pub/scm/fs/xfs/xfstests-dev.git
>> =

>> =

>> on test machine: 4 threads 1 sockets Intel(R) Core(TM) i3-3220 CPU @ 3.3=
0GHz with 8G memory
>> =

>> caused below changes (please refer to attached dmesg/kmsg for entire log=
/backtrace):
>> =

>> =

>> =

>> =

>> If you fix the issue, kindly add following tag
>> Reported-by: kernel test robot <oliver.sang@intel.com>
>> =

>> =

>> xfs/533	[failed, exit status 1]- output mismatch (see /lkp/benchmarks/xf=
stests/results//xfs/533.out.bad)
>>     --- tests/xfs/533.out	2022-04-14 12:51:49.000000000 +0000
>>     +++ /lkp/benchmarks/xfstests/results//xfs/533.out.bad	2022-05-03 06:=
24:37.310381846 +0000
>>     @@ -6,12 +6,4 @@
>>      Inject bmap_alloc_minlen_extent error tag
>>      * Create directory entries
>>      Verify directory's extent count
>>     -* Rename: Populate destination directory
>>     -Populate $dstdir by moving new directory entries
>>     -Verify $dstdir's extent count
>>     -* Create multiple hard links to a single file
>>     ...
>>     (Run 'diff -u /lkp/benchmarks/xfstests/tests/xfs/533.out /lkp/benchm=
arks/xfstests/results//xfs/533.out.bad'  to see the entire diff)
>
> Not a regression. This is testing directory data fork extent count
> overflow using error injection, but you might notice that the title
> of the commit is "Directory's data fork extent counter can never
> overflow".
>
> IOWs, we changed fine grained directory extent count overflow
> from a runtime check (on every dir op) to an inode verifier
> check that is only run when the directory inode is read from or
> written to disk.
>
> The test probably should be removed. Chandan?
>

Yes, I have just sent a patch to fstests mailing list to remove xfs/533 tes=
t.

-- =

chandan
--===============2623215633316760868==--

