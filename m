Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795617261;
	b=eQ7PG1KadT52N06ovVzLl5OCgDlxnuTFdG5brYRSyQtiLuUQfrbzLGpMFVccJwDY8XsH
	 ttJJVHttdBJbPj7z0BoVO+8m8WiKaKQsW4n0Jw91Erf5xZkaDwm8DoDcf0oHcKdJ5GIbi
	 E9j2LiBv3SRt2V2rY90cN6+tUwaJmuuF+5xdD882dIqrQQHQlJlY8flRB49v4llvV2PaE
	 +zV3G56MQzTN2GPICwPm9J5iSuQ4KcrT1wXyBo6e22Efu57HeFKAuue8Jh9zJSdwtGJMj
	 zt+4acRq8V6eh3HdFKsbWaFCeLBcECsxqN96F7q2BY1xa6e20TgV2VAyhJMfSwye3jw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795617261;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=TDpwSW0SovqJTr4+b7sAFvQMCYEa/KOX5wGtNTlNmww=;
	b=20DzC4q6kyc5mg9ota//i6TCKMVQEVwEW6oyS7GWNV4L6d4TUZoW7vij8gUorkdbNwVI
	 f7DyoCAEVPmfdIo2tSLMimFQuGtGJdabB+VCOFU1e5YnlZBQcISk0A3XKvu4zgGcGuLEm
	 DGumHc4jYTjNluw1GfsOh6ARQ5+186W1MlJe8oX0C0uW1UwBSVBlL/OzfrTUvhpsJ358j
	 lYyMpm9a/uVF9lrkJPXK75vPBS/TfhK9PQAIj+q54Fq04CtDQfD3FPGhf8pJvZHfu35LJ
	 UmC5rfH4OFkSZ5rG6XvOS5EWTe23eUFFo5ul+ARDfRoqEl7j8jEtzRFq5KSGFZd5hqw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=QZphkbqi;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2FC5B606A31E
	for <oe-lkp@lists.linux.dev>; Wed, 25 Nov 2026 14:34:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=QZphkbqi
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8F9B81F000C4;
	Wed, 25 Nov 2026 14:34:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795617260;
	bh=TDpwSW0SovqJTr4+b7sAFvQMCYEa/KOX5wGtNTlNmww=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=QZphkbqiQviPmNnHK1XBwvI30DAEm0/8tLHArq5YTm0KtU7md/n0gWJtBiwvL2BKb
	 BIx1iUOCnI0AGiATutnE5AJQvvcG3/uaHG93wdAdJ+VAVRRUKEvVgrRMaYJJqDU9Ze
	 6C3Qsv2Pq2KVgIWICNnzxjPFYoAKF+X/RZKORPStr/q2+Ml3FR1PeEE/VnUdqK1xyo
	 BckPlgm+BtMRmdg7rIBa75A/xZhAl4PBJUApDNqz4DGNo7X7/IkesEszGoIogunx20
	 oO1VUoMIZ1HaEsykxT6wF4ipCZS/vICC7alvgV4/jNsUYQxxgcsPHAshXgz02Cpa8I
	 cgkn4n+H6CKzA==
Date: Wed, 25 Nov 2026 14:34:15 +0000
From: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
To: kernel test robot <yi1.lai@intel.com>
Cc: oe-lkp@lists.linux.dev, lkp@intel.com, 
	David Hildenbrand <david@kernel.org>, Eliav Farber <farbere@amazon.com>, 
	"Jose A. Perez de Azpillaga" <azpijr@gmail.com>, Zi Yan <ziy@nvidia.com>, linux-mm@kvack.org
Subject: Re: [linux-next:master] [mm/memory]  f8eca7ec1b:
 xfstests.generic.437.fail
Message-ID: <awbxo7VZyrECnFtj@gremlin>
References: <202611252134.37a9cb7e-lkp@intel.com>
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Post: <mailto:oe-lkp@lists.linux.dev>
List-Help: <mailto:oe-lkp+help@lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-lkp+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <202611252134.37a9cb7e-lkp@intel.com>

On Wed, Nov 25, 2026 at 09:47:05PM +0800, kernel test robot wrote:
>
>
> Hello,
>
> kernel test robot noticed "xfstests.generic.437.fail" on:
>
> commit: f8eca7ec1b368557613cc727abadc82546c1f46a ("mm/memory: do not report OOM if insert_pfn() races a huge fault") https://git.kernel.org/cgit/linux/kernel/git/next/linux-next.git master
>
> [test failed on linux-next/master 3dd8c790a7b7027abdd568e36db5e82ffaea7c77]
>
> in testcase: xfstests
> version: xfstests-x86_64-d07dca72-1_20261110
> with following parameters:
>
> 	bp1_memmap: 4G!8G
> 	bp2_memmap: 4G!10G
> 	bp3_memmap: 4G!16G
> 	bp4_memmap: 4G!22G
> 	nr_pmem: 4
> 	fs: ext4
> 	test: generic-dax

Ack let me fix this, I need to have this return -EBUSY not -EFAULT, meant to do
this sooner but got so tied up with other fixes ugh.

>
>
> config: x86_64-rhel-9.4-func
> compiler: gcc-14
> test machine: 8 threads Intel(R) Core(TM) i7-6700 CPU @ 3.40GHz (Skylake) with 28G memory
>
> (please refer to attached dmesg/kmsg for entire log/backtrace)
>
>
> If you fix the issue in a separate patch/commit (i.e. not just a new version of the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <yi1.lai@intel.com>
> | Closes: https://lore.kernel.org/oe-lkp/202611252134.37a9cb7e-lkp@intel.com
>
>
> 2026-11-25 00:16:54 cd /lkp/benchmarks/xfstests
> 2026-11-25 00:16:54 export TEST_DIR=/fs/pmem0
> 2026-11-25 00:16:54 export TEST_DEV=/dev/pmem0
> 2026-11-25 00:16:54 export FSTYP=ext4
> 2026-11-25 00:16:54 export SCRATCH_MNT=/fs/scratch
> 2026-11-25 00:16:54 mkdir /fs/scratch -p
> 2026-11-25 00:16:54 export SCRATCH_DEV=/dev/pmem3
> 2026-11-25 00:16:54 export LOGWRITES_DEV=/dev/pmem1
> 2026-11-25 00:16:54 export LOGWRITES_DEV=/dev/pmem1
> 2026-11-25 00:16:54 export MOUNT_OPTIONS="-o dax"
> 2026-11-25 00:16:54 sed "s:^:generic/:" /lkp/benchmarks/xfstests/tests/generic-dax
> 2026-11-25 00:16:54 ./check -E tests/exclude/ext4 generic/413 generic/428 generic/437 generic/452 generic/462 generic/470 generic/503 generic/605 generic/606 generic/607 generic/608
> FSTYP         -- ext4
> PLATFORM      -- Linux/x86_64 lkp-skl-d01 7.4.0-rc3+ #1 SMP PREEMPT Wed Nov 25 07:55:29 CST 2026
> MKFS_OPTIONS  -- -F /dev/pmem3
> MOUNT_OPTIONS -- -o dax /dev/pmem3 /fs/scratch
>
> generic/413         4s
> generic/428         1s
> generic/437        - output mismatch (see /lkp/benchmarks/xfstests/results//generic/437.out.bad)
>     --- /lkp/benchmarks/xfstests/tests/generic/437.out	2026-11-10 14:32:16.000000000 +0000
>     +++ /lkp/benchmarks/xfstests/results//generic/437.out.bad	2026-11-25 00:17:00.840164485 +0000
>     @@ -1,2 +1,3 @@
>      QA output created by 437
>     +/lkp/benchmarks/xfstests/tests/generic/437: line 22:  5709 Bus error               $here/src/t_mmap_cow_race $TEST_DIR/testfile
>      Silence is golden
>     ...
>     (Run 'diff -u /lkp/benchmarks/xfstests/tests/generic/437.out /lkp/benchmarks/xfstests/results//generic/437.out.bad'  to see the entire diff)
> generic/452         1s
> generic/462         1s
> generic/470        [not run] xfs_io log_writes  support is missing
> generic/503         5s
> generic/605         5s
> generic/606         1s
> generic/607         3s
> generic/608         1s
> Ran: generic/413 generic/428 generic/437 generic/452 generic/462 generic/470 generic/503 generic/605 generic/606 generic/607 generic/608 Not run: generic/470
> Failures: generic/437
> Failed 1 of 11 tests
>
>
>
>
> The kernel config and materials to reproduce are available at:
> https://download.01.org/0day-ci/archive/20261125/202611252134.37a9cb7e-lkp@intel.com
>
>
>
> --
> 0-DAY CI Kernel Test Service
> https://github.com/intel/lkp-tests/wiki
>
>

--
Cheers, Lorenzo
