Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 262AF3D75A0
	for <oe-lkp@lists.linux.dev>; Mon, 30 Mar 2026 14:06:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774879606; cv=none; b=XOzMZlKuvyTRZgkCzdluTkJIuc6sxe8ClYlbgemmcn/a8hzspsP7Uvdzensq8S7yhPnF4wM2Z6pdcoGo4jiJ3mQdNP7uwNXmrlovnGRXyHcnbGUwMxndGsB35iEOumS1yRzY5Dap+vPE4IQD937sHj4+97GfeFPs2Oel4v1tdIU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774879606; c=relaxed/simple;
	bh=fhEugQLyPAkBmo+yDLgQGsY50nwY11NJzNLYdwn+tZ4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hDcxeO8gdrtT6bDDYB9J4jcSqEOUQc+7dh5IywAN65GmiO4gq1XFdx5m2Fy6OaI+rs5VvYFLA5tZVM4xP+o48LFtR6LmXLrewV+DBYjezClqky74N9nc2sYvC9B01eD9yg7YoN1dHj0J7pyz1DVx2HUTaZlj055ecAsk5DG7CRA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=E50nERGV; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="E50nERGV"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 338D8C2BCB2;
	Mon, 30 Mar 2026 14:06:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774879605;
	bh=fhEugQLyPAkBmo+yDLgQGsY50nwY11NJzNLYdwn+tZ4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=E50nERGVa7Y96mhJLxplUBCC2IdBdWrHmuRgc/nJVsh7j23h91yyvRlZZIwbQ4Hiw
	 diJIyJP81T8wTgPzWoW4p9aR4eaMajoMfjmz7d5pyUOY3TelL6KxpdbwvtUp+O9IEp
	 D03AcO86JSu6nw2DNp5if/hGYZXJ5m39Vefq0XX3g7rCQ5r2Q/IgImsl22ZNv7YULt
	 TMvBSZghp/uPmE+veJi5if6dm4i6heLpRpfnyeSlMkeamcNA9YFk1vc1N/prOcfj6K
	 TTanGiJtvWzE/mm4RAYulg9D1047BU8w09ts2b1GUE9LA86NrtYhdyPMXQksJ2iVAO
	 kbNfDIL8+4G9Q==
Date: Mon, 30 Mar 2026 15:06:39 +0100
From: "Lorenzo Stoakes (Oracle)" <ljs@kernel.org>
To: kernel test robot <oliver.sang@intel.com>
Cc: Andrew Morton <akpm@linux-foundation.org>, oe-lkp@lists.linux.dev, 
	lkp@intel.com, Chris Down <chris@chrisdown.name>, 
	David Hildenbrand <david@kernel.org>, Liam Howlett <liam.howlett@oracle.com>, 
	Matthew Wilcox <willy@infradead.org>, Michal Hocko <mhocko@suse.com>, Mike Rapoport <rppt@kernel.org>, 
	Peter Xu <peterx@redhat.com>, Shuah Khan <shuah@kernel.org>, 
	Suren Baghdasaryan <surenb@google.com>, Vlastimil Babka <vbabka@kernel.org>, linux-mm@kvack.org
Subject: Re: [linux-next:master] [selftests]  9652b82ca9:
 kernel-selftests.mm.make.fail
Message-ID: <c7bedad1-05fb-457a-b0a5-47d7a09fa254@lucifer.local>
References: <202603302149.1db397e2-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <202603302149.1db397e2-lkp@intel.com>

On Mon, Mar 30, 2026 at 09:33:51PM +0800, kernel test robot wrote:
>
>
> Hello,
>
> kernel test robot noticed "kernel-selftests.mm.make.fail" on:

This is because of an issue with a fix-patch and another series getting yanked,
it's fixed in the mm-unstable tree, so should percolate it's way down to -next
soon.

Cheers, Lorenzo

>
> commit: 9652b82ca963243fb80e645319d473a7dc65ee79 ("selftests-mm-add-uffdio_move-huge-zeropage-pmd-regression-test-fix")
> https://git.kernel.org/cgit/linux/kernel/git/next/linux-next.git master
>
> [test failed on linux-next/master 3b058d1aeeeff27a7289529c4944291613b364e9]
>
> in testcase: kernel-selftests
> version: kernel-selftests-x86_64-c369299895a5-1_20260323
> with following parameters:
>
> 	sc_nr_hugepages: 2
> 	group: mm
>
>
>
> config: x86_64-rhel-9.4-kselftests
> compiler: gcc-14
> test machine: 36 threads 1 sockets Intel(R) Core(TM) i9-9980XE CPU @ 3.00GHz (Skylake) with 32G memory
>
> (please refer to attached dmesg/kmsg for entire log/backtrace)
>
>
>
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <oliver.sang@intel.com>
> | Closes: https://lore.kernel.org/oe-lkp/202603302149.1db397e2-lkp@intel.com
>
>
> KERNEL SELFTESTS: linux_headers_dir is /usr/src/linux-headers-x86_64-rhel-9.4-kselftests-9652b82ca963243fb80e645319d473a7dc65ee79
> 2026-03-28 07:10:57 sed -i s/default_timeout=45/default_timeout=300/ kselftest/runner.sh
> fixup_test_group: fixup_mm /usr/src/perf_selftests-x86_64-rhel-9.4-kselftests-9652b82ca963243fb80e645319d473a7dc65ee79/tools/testing/selftests
> 2026-03-28 07:10:57 make -j36 install TARGETS=mm INSTALL_PATH=/opt/rootfs/tmp/kselftests/mm
> make[1]: Entering directory '/usr/src/perf_selftests-x86_64-rhel-9.4-kselftests-9652b82ca963243fb80e645319d473a7dc65ee79/tools/testing/selftests/mm'
> CC="gcc" CFLAGS="-Wall -O2 -I /usr/src/perf_selftests-x86_64-rhel-9.4-kselftests-9652b82ca963243fb80e645319d473a7dc65ee79/tools/testing/selftests/../../..  -isystem /usr/src/perf_selftests-x86_64-rhel-9.4-kselftests-9652b82ca963243fb80e645319d473a7dc65ee79/usr/include -isystem /usr/src/perf_selftests-x86_64-rhel-9.4-kselftests-9652b82ca963243fb80e645319d473a7dc65ee79/tools/testing/selftests/../../../tools/include/uapi -Wunreachable-code -U_FORTIFY_SOURCE -no-pie -D_GNU_SOURCE= -I/usr/src/perf_selftests-x86_64-rhel-9.4-kselftests-9652b82ca963243fb80e645319d473a7dc65ee79/tools/testing/selftests/../../../tools/testing/selftests " ./check_config.sh
>   CC       cow
>   CC       compaction_test
>   CC       gup_longterm
>   CC       gup_test
>   CC       hmm-tests
>   CC       hugetlb-madvise
>   CC       hugetlb-read-hwpoison
>   CC       hugetlb-soft-offline
>   CC       hugepage-mmap
>   CC       hugepage-mremap
>   CC       hugepage-shm
>   CC       hugepage-vmemmap
>   CC       khugepaged
>   CC       madv_populate
>   CC       map_fixed_noreplace
>   CC       map_hugetlb
>   CC       map_populate
>   CC       memfd_secret
>   CC       memory-failure
>   CC       migration
>   CC       mkdirty
>   CC       mlock-random-test
>   CC       mlock2-tests
>   CC       mrelease_test
>   CC       mremap_test
>   CC       mremap_dontunmap
>   CC       mseal_test
>   CC       on-fault-limit
>   CC       pagemap_ioctl
>   CC       pfnmap
>   CC       process_madv
>   CC       prctl_thp_disable
>   CC       thuge-gen
>   CC       transhuge-stress
>   CC       uffd-stress
>   CC       uffd-unit-tests
> vm_util.c: In function ‘pagemap_is_huge_zero’:
> vm_util.c:127:14: error: too few arguments to function ‘pagemap_scan_supported’
>   127 |         if (!pagemap_scan_supported(fd))
>       |              ^~~~~~~~~~~~~~~~~~~~~~
> vm_util.c:70:13: note: declared here
>    70 | static bool pagemap_scan_supported(int fd, char *start)
>       |             ^~~~~~~~~~~~~~~~~~~~~~
> vm_util.c: In function ‘pagemap_is_huge_zero’:
> vm_util.c:127:14: error: too few arguments to function ‘pagemap_scan_supported’
>   127 |         if (!pagemap_scan_supported(fd))
>       |              ^~~~~~~~~~~~~~~~~~~~~~
> vm_util.c:70:13: note: declared here
>    70 | static bool pagemap_scan_supported(int fd, char *start)
>       |             ^~~~~~~~~~~~~~~~~~~~~~
> vm_util.c: In function ‘pagemap_is_huge_zero’:
> vm_util.c:127:14: error: too few arguments to function ‘pagemap_scan_supported’
>   127 |         if (!pagemap_scan_supported(fd))
>       |              ^~~~~~~~~~~~~~~~~~~~~~
> vm_util.c:70:13: note: declared here
>    70 | static bool pagemap_scan_supported(int fd, char *start)
>       |             ^~~~~~~~~~~~~~~~~~~~~~
> vm_util.c: In function ‘pagemap_is_huge_zero’:
> vm_util.c:127:14: error: too few arguments to function ‘pagemap_scan_supported’
>   127 |         if (!pagemap_scan_supported(fd))
>       |              ^~~~~~~~~~~~~~~~~~~~~~
> vm_util.c: In function ‘pagemap_is_huge_zero’:
> vm_util.c:127:14: error: too few arguments to function ‘pagemap_scan_supported’
>   127 |         if (!pagemap_scan_supported(fd))
>       |              ^~~~~~~~~~~~~~~~~~~~~~
> vm_util.c:70:13: note: declared here
>    70 | static bool pagemap_scan_supported(int fd, char *start)
>       |             ^~~~~~~~~~~~~~~~~~~~~~
> vm_util.c:70:13: note: declared here
>    70 | static bool pagemap_scan_supported(int fd, char *start)
>       |             ^~~~~~~~~~~~~~~~~~~~~~
> vm_util.c: In function ‘pagemap_is_huge_zero’:
> vm_util.c:127:14: error: too few arguments to function ‘pagemap_scan_supported’
>   127 |         if (!pagemap_scan_supported(fd))
>       |              ^~~~~~~~~~~~~~~~~~~~~~
> vm_util.c:70:13: note: declared here
>    70 | static bool pagemap_scan_supported(int fd, char *start)
>       |             ^~~~~~~~~~~~~~~~~~~~~~
> vm_util.c: In function ‘pagemap_is_huge_zero’:
> vm_util.c:127:14: error: too few arguments to function ‘pagemap_scan_supported’
>   127 |         if (!pagemap_scan_supported(fd))
>       |              ^~~~~~~~~~~~~~~~~~~~~~
> vm_util.c:70:13: note: declared here
>    70 | static bool pagemap_scan_supported(int fd, char *start)
>       |             ^~~~~~~~~~~~~~~~~~~~~~
> vm_util.c: In function ‘pagemap_is_huge_zero’:
> vm_util.c:127:14: error: too few arguments to function ‘pagemap_scan_supported’
>   127 |         if (!pagemap_scan_supported(fd))
>       |              ^~~~~~~~~~~~~~~~~~~~~~
> vm_util.c:70:13: note: declared here
>    70 | static bool pagemap_scan_supported(int fd, char *start)
>       |             ^~~~~~~~~~~~~~~~~~~~~~
> vm_util.c: In function ‘pagemap_is_huge_zero’:
> vm_util.c:127:14: error: too few arguments to function ‘pagemap_scan_supported’
>   127 |         if (!pagemap_scan_supported(fd))
>       |              ^~~~~~~~~~~~~~~~~~~~~~
> vm_util.c:70:13: note: declared here
>    70 | static bool pagemap_scan_supported(int fd, char *start)
>       |             ^~~~~~~~~~~~~~~~~~~~~~
> vm_util.c: In function ‘pagemap_is_huge_zero’:
> vm_util.c: In function ‘pagemap_is_huge_zero’:
> vm_util.c:127:14: error: too few arguments to function ‘pagemap_scan_supported’
>   127 |         if (!pagemap_scan_supported(fd))
>       |              ^~~~~~~~~~~~~~~~~~~~~~
> vm_util.c:70:13: note: declared here
>    70 | static bool pagemap_scan_supported(int fd, char *start)
>       |             ^~~~~~~~~~~~~~~~~~~~~~
> vm_util.c:127:14: error: too few arguments to function ‘pagemap_scan_supported’
>   127 |         if (!pagemap_scan_supported(fd))
>       |              ^~~~~~~~~~~~~~~~~~~~~~
> vm_util.c:70:13: note: declared here
>    70 | static bool pagemap_scan_supported(int fd, char *start)
>       |             ^~~~~~~~~~~~~~~~~~~~~~
> vm_util.c: In function ‘pagemap_is_huge_zero’:
> vm_util.c:127:14: error: too few arguments to function ‘pagemap_scan_supported’
>   127 |         if (!pagemap_scan_supported(fd))
>       |              ^~~~~~~~~~~~~~~~~~~~~~
> vm_util.c:70:13: note: declared here
>    70 | static bool pagemap_scan_supported(int fd, char *start)
>       |             ^~~~~~~~~~~~~~~~~~~~~~
> vm_util.c: In function ‘pagemap_is_huge_zero’:
> vm_util.c:127:14: error: too few arguments to function ‘pagemap_scan_supported’
>   127 |         if (!pagemap_scan_supported(fd))
>       |              ^~~~~~~~~~~~~~~~~~~~~~
> vm_util.c:70:13: note: declared here
>    70 | static bool pagemap_scan_supported(int fd, char *start)
>       |             ^~~~~~~~~~~~~~~~~~~~~~
> vm_util.c: In function ‘pagemap_is_huge_zero’:
> vm_util.c:127:14: error: too few arguments to function ‘pagemap_scan_supported’
>   127 |         if (!pagemap_scan_supported(fd))
>       |              ^~~~~~~~~~~~~~~~~~~~~~
> vm_util.c:70:13: note: declared here
>    70 | static bool pagemap_scan_supported(int fd, char *start)
>       |             ^~~~~~~~~~~~~~~~~~~~~~
> vm_util.c: In function ‘pagemap_is_huge_zero’:
> vm_util.c:127:14: error: too few arguments to function ‘pagemap_scan_supported’
>   127 |         if (!pagemap_scan_supported(fd))
>       |              ^~~~~~~~~~~~~~~~~~~~~~
> vm_util.c:70:13: note: declared here
>    70 | static bool pagemap_scan_supported(int fd, char *start)
>       |             ^~~~~~~~~~~~~~~~~~~~~~
> vm_util.c: In function ‘pagemap_is_huge_zero’:
> vm_util.c:127:14: error: too few arguments to function ‘pagemap_scan_supported’
>   127 |         if (!pagemap_scan_supported(fd))
>       |              ^~~~~~~~~~~~~~~~~~~~~~
> vm_util.c:70:13: note: declared here
>    70 | static bool pagemap_scan_supported(int fd, char *start)
>       |             ^~~~~~~~~~~~~~~~~~~~~~
> vm_util.c: In function ‘pagemap_is_huge_zero’:
> vm_util.c:127:14: error: too few arguments to function ‘pagemap_scan_supported’
>   127 |         if (!pagemap_scan_supported(fd))
>       |              ^~~~~~~~~~~~~~~~~~~~~~
> vm_util.c:70:13: note: declared here
>    70 | static bool pagemap_scan_supported(int fd, char *start)
>       |             ^~~~~~~~~~~~~~~~~~~~~~
> vm_util.c: In function ‘pagemap_is_huge_zero’:
> vm_util.c:127:14: error: too few arguments to function ‘pagemap_scan_supported’
>   127 |         if (!pagemap_scan_supported(fd))
>       |              ^~~~~~~~~~~~~~~~~~~~~~
> vm_util.c:70:13: note: declared here
>    70 | static bool pagemap_scan_supported(int fd, char *start)
>       |             ^~~~~~~~~~~~~~~~~~~~~~
> vm_util.c: In function ‘pagemap_is_huge_zero’:
> vm_util.c:127:14: error: too few arguments to function ‘pagemap_scan_supported’
>   127 |         if (!pagemap_scan_supported(fd))
>       |              ^~~~~~~~~~~~~~~~~~~~~~
> vm_util.c:70:13: note: declared here
>    70 | static bool pagemap_scan_supported(int fd, char *start)
>       |             ^~~~~~~~~~~~~~~~~~~~~~
> vm_util.c: In function ‘pagemap_is_huge_zero’:
> vm_util.c:127:14: error: too few arguments to function ‘pagemap_scan_supported’
>   127 |         if (!pagemap_scan_supported(fd))
>       |              ^~~~~~~~~~~~~~~~~~~~~~
> vm_util.c:70:13: note: declared here
>    70 | static bool pagemap_scan_supported(int fd, char *start)
>       |             ^~~~~~~~~~~~~~~~~~~~~~
> vm_util.c: In function ‘pagemap_is_huge_zero’:
> vm_util.c:127:14: error: too few arguments to function ‘pagemap_scan_supported’
>   127 |         if (!pagemap_scan_supported(fd))
>       |              ^~~~~~~~~~~~~~~~~~~~~~
> vm_util.c:70:13: note: declared here
>    70 | static bool pagemap_scan_supported(int fd, char *start)
>       |             ^~~~~~~~~~~~~~~~~~~~~~
> vm_util.c: In function ‘pagemap_is_huge_zero’:
> vm_util.c:127:14: error: too few arguments to function ‘pagemap_scan_supported’
>   127 |         if (!pagemap_scan_supported(fd))
>       |              ^~~~~~~~~~~~~~~~~~~~~~
> vm_util.c:70:13: note: declared here
>    70 | static bool pagemap_scan_supported(int fd, char *start)
>       |             ^~~~~~~~~~~~~~~~~~~~~~
> vm_util.c: In function ‘pagemap_is_huge_zero’:
> vm_util.c:127:14: error: too few arguments to function ‘pagemap_scan_supported’
>   127 |         if (!pagemap_scan_supported(fd))
>       |              ^~~~~~~~~~~~~~~~~~~~~~
> vm_util.c:70:13: note: declared here
>    70 | static bool pagemap_scan_supported(int fd, char *start)
>       |             ^~~~~~~~~~~~~~~~~~~~~~
> make[1]: *** [../lib.mk:224: /usr/src/perf_selftests-x86_64-rhel-9.4-kselftests-9652b82ca963243fb80e645319d473a7dc65ee79/tools/testing/selftests/mm/hugepage-shm] Error 1
> make[1]: *** Waiting for unfinished jobs....
> make[1]: *** [../lib.mk:224: /usr/src/perf_selftests-x86_64-rhel-9.4-kselftests-9652b82ca963243fb80e645319d473a7dc65ee79/tools/testing/selftests/mm/map_hugetlb] Error 1
> make[1]: *** [../lib.mk:224: /usr/src/perf_selftests-x86_64-rhel-9.4-kselftests-9652b82ca963243fb80e645319d473a7dc65ee79/tools/testing/selftests/mm/compaction_test] Error 1
> make[1]: *** [../lib.mk:224: /usr/src/perf_selftests-x86_64-rhel-9.4-kselftests-9652b82ca963243fb80e645319d473a7dc65ee79/tools/testing/selftests/mm/hugepage-mmap] Error 1
> make[1]: *** [../lib.mk:224: /usr/src/perf_selftests-x86_64-rhel-9.4-kselftests-9652b82ca963243fb80e645319d473a7dc65ee79/tools/testing/selftests/mm/hugepage-vmemmap] Error 1
> make[1]: *** [../lib.mk:224: /usr/src/perf_selftests-x86_64-rhel-9.4-kselftests-9652b82ca963243fb80e645319d473a7dc65ee79/tools/testing/selftests/mm/map_fixed_noreplace] Error 1
> make[1]: *** [../lib.mk:224: /usr/src/perf_selftests-x86_64-rhel-9.4-kselftests-9652b82ca963243fb80e645319d473a7dc65ee79/tools/testing/selftests/mm/hugetlb-read-hwpoison] Error 1
> make[1]: *** [../lib.mk:224: /usr/src/perf_selftests-x86_64-rhel-9.4-kselftests-9652b82ca963243fb80e645319d473a7dc65ee79/tools/testing/selftests/mm/on-fault-limit] Error 1
> make[1]: *** [../lib.mk:224: /usr/src/perf_selftests-x86_64-rhel-9.4-kselftests-9652b82ca963243fb80e645319d473a7dc65ee79/tools/testing/selftests/mm/hugepage-mremap] Error 1
> make[1]: *** [../lib.mk:224: /usr/src/perf_selftests-x86_64-rhel-9.4-kselftests-9652b82ca963243fb80e645319d473a7dc65ee79/tools/testing/selftests/mm/madv_populate] Error 1
> make[1]: *** [../lib.mk:224: /usr/src/perf_selftests-x86_64-rhel-9.4-kselftests-9652b82ca963243fb80e645319d473a7dc65ee79/tools/testing/selftests/mm/hugetlb-madvise] Error 1
> make[1]: *** [../lib.mk:224: /usr/src/perf_selftests-x86_64-rhel-9.4-kselftests-9652b82ca963243fb80e645319d473a7dc65ee79/tools/testing/selftests/mm/transhuge-stress] Error 1
> vm_util.c: In function ‘pagemap_is_huge_zero’:
> vm_util.c:127:14: error: too few arguments to function ‘pagemap_scan_supported’
>   127 |         if (!pagemap_scan_supported(fd))
>       |              ^~~~~~~~~~~~~~~~~~~~~~
> vm_util.c:70:13: note: declared here
>    70 | static bool pagemap_scan_supported(int fd, char *start)
>       |             ^~~~~~~~~~~~~~~~~~~~~~
> make[1]: *** [../lib.mk:224: /usr/src/perf_selftests-x86_64-rhel-9.4-kselftests-9652b82ca963243fb80e645319d473a7dc65ee79/tools/testing/selftests/mm/mlock-random-test] Error 1
> vm_util.c: In function ‘pagemap_is_huge_zero’:
> vm_util.c:127:14: error: too few arguments to function ‘pagemap_scan_supported’
>   127 |         if (!pagemap_scan_supported(fd))
>       |              ^~~~~~~~~~~~~~~~~~~~~~
> vm_util.c:70:13: note: declared here
>    70 | static bool pagemap_scan_supported(int fd, char *start)
>       |             ^~~~~~~~~~~~~~~~~~~~~~
> make[1]: *** [../lib.mk:224: /usr/src/perf_selftests-x86_64-rhel-9.4-kselftests-9652b82ca963243fb80e645319d473a7dc65ee79/tools/testing/selftests/mm/hugetlb-soft-offline] Error 1
> make[1]: *** [../lib.mk:224: /usr/src/perf_selftests-x86_64-rhel-9.4-kselftests-9652b82ca963243fb80e645319d473a7dc65ee79/tools/testing/selftests/mm/mkdirty] Error 1
> make[1]: *** [../lib.mk:224: /usr/src/perf_selftests-x86_64-rhel-9.4-kselftests-9652b82ca963243fb80e645319d473a7dc65ee79/tools/testing/selftests/mm/map_populate] Error 1
> make[1]: *** [../lib.mk:224: /usr/src/perf_selftests-x86_64-rhel-9.4-kselftests-9652b82ca963243fb80e645319d473a7dc65ee79/tools/testing/selftests/mm/gup_test] Error 1
> vm_util.c: In function ‘pagemap_is_huge_zero’:
> vm_util.c:127:14: error: too few arguments to function ‘pagemap_scan_supported’
>   127 |         if (!pagemap_scan_supported(fd))
>       |              ^~~~~~~~~~~~~~~~~~~~~~
> vm_util.c:70:13: note: declared here
>    70 | static bool pagemap_scan_supported(int fd, char *start)
>       |             ^~~~~~~~~~~~~~~~~~~~~~
> make[1]: *** [../lib.mk:224: /usr/src/perf_selftests-x86_64-rhel-9.4-kselftests-9652b82ca963243fb80e645319d473a7dc65ee79/tools/testing/selftests/mm/memfd_secret] Error 1
> vm_util.c: In function ‘pagemap_is_huge_zero’:
> vm_util.c:127:14: error: too few arguments to function ‘pagemap_scan_supported’
>   127 |         if (!pagemap_scan_supported(fd))
>       |              ^~~~~~~~~~~~~~~~~~~~~~
> vm_util.c:70:13: note: declared here
>    70 | static bool pagemap_scan_supported(int fd, char *start)
>       |             ^~~~~~~~~~~~~~~~~~~~~~
> vm_util.c: In function ‘pagemap_is_huge_zero’:
> vm_util.c:127:14: error: too few arguments to function ‘pagemap_scan_supported’
>   127 |         if (!pagemap_scan_supported(fd))
>       |              ^~~~~~~~~~~~~~~~~~~~~~
> vm_util.c:70:13: note: declared here
>    70 | static bool pagemap_scan_supported(int fd, char *start)
>       |             ^~~~~~~~~~~~~~~~~~~~~~
> make[1]: *** [../lib.mk:224: /usr/src/perf_selftests-x86_64-rhel-9.4-kselftests-9652b82ca963243fb80e645319d473a7dc65ee79/tools/testing/selftests/mm/mrelease_test] Error 1
> vm_util.c: In function ‘pagemap_is_huge_zero’:
> vm_util.c:127:14: error: too few arguments to function ‘pagemap_scan_supported’
>   127 |         if (!pagemap_scan_supported(fd))
>       |              ^~~~~~~~~~~~~~~~~~~~~~
> vm_util.c:70:13: note: declared here
>    70 | static bool pagemap_scan_supported(int fd, char *start)
>       |             ^~~~~~~~~~~~~~~~~~~~~~
> make[1]: *** [../lib.mk:224: /usr/src/perf_selftests-x86_64-rhel-9.4-kselftests-9652b82ca963243fb80e645319d473a7dc65ee79/tools/testing/selftests/mm/mlock2-tests] Error 1
> vm_util.c: In function ‘pagemap_is_huge_zero’:
> vm_util.c:127:14: error: too few arguments to function ‘pagemap_scan_supported’
>   127 |         if (!pagemap_scan_supported(fd))
>       |              ^~~~~~~~~~~~~~~~~~~~~~
> vm_util.c:70:13: note: declared here
>    70 | static bool pagemap_scan_supported(int fd, char *start)
>       |             ^~~~~~~~~~~~~~~~~~~~~~
> make[1]: *** [../lib.mk:224: /usr/src/perf_selftests-x86_64-rhel-9.4-kselftests-9652b82ca963243fb80e645319d473a7dc65ee79/tools/testing/selftests/mm/mremap_dontunmap] Error 1
> vm_util.c: In function ‘pagemap_is_huge_zero’:
> vm_util.c:127:14: error: too few arguments to function ‘pagemap_scan_supported’
>   127 |         if (!pagemap_scan_supported(fd))
>       |              ^~~~~~~~~~~~~~~~~~~~~~
> vm_util.c:70:13: note: declared here
>    70 | static bool pagemap_scan_supported(int fd, char *start)
>       |             ^~~~~~~~~~~~~~~~~~~~~~
> make[1]: *** [../lib.mk:224: /usr/src/perf_selftests-x86_64-rhel-9.4-kselftests-9652b82ca963243fb80e645319d473a7dc65ee79/tools/testing/selftests/mm/gup_longterm] Error 1
> make[1]: *** [../lib.mk:224: /usr/src/perf_selftests-x86_64-rhel-9.4-kselftests-9652b82ca963243fb80e645319d473a7dc65ee79/tools/testing/selftests/mm/thuge-gen] Error 1
> vm_util.c: In function ‘pagemap_is_huge_zero’:
> vm_util.c:127:14: error: too few arguments to function ‘pagemap_scan_supported’
>   127 |         if (!pagemap_scan_supported(fd))
>       |              ^~~~~~~~~~~~~~~~~~~~~~
> vm_util.c:70:13: note: declared here
>    70 | static bool pagemap_scan_supported(int fd, char *start)
>       |             ^~~~~~~~~~~~~~~~~~~~~~
> vm_util.c: In function ‘pagemap_is_huge_zero’:
> vm_util.c:127:14: error: too few arguments to function ‘pagemap_scan_supported’
>   127 |         if (!pagemap_scan_supported(fd))
>       |              ^~~~~~~~~~~~~~~~~~~~~~
> vm_util.c:70:13: note: declared here
>    70 | static bool pagemap_scan_supported(int fd, char *start)
>       |             ^~~~~~~~~~~~~~~~~~~~~~
> make[1]: *** [../lib.mk:224: /usr/src/perf_selftests-x86_64-rhel-9.4-kselftests-9652b82ca963243fb80e645319d473a7dc65ee79/tools/testing/selftests/mm/prctl_thp_disable] Error 1
> make[1]: *** [../lib.mk:224: /usr/src/perf_selftests-x86_64-rhel-9.4-kselftests-9652b82ca963243fb80e645319d473a7dc65ee79/tools/testing/selftests/mm/memory-failure] Error 1
> make[1]: *** [../lib.mk:224: /usr/src/perf_selftests-x86_64-rhel-9.4-kselftests-9652b82ca963243fb80e645319d473a7dc65ee79/tools/testing/selftests/mm/pfnmap] Error 1
> vm_util.c: In function ‘pagemap_is_huge_zero’:
> vm_util.c:127:14: error: too few arguments to function ‘pagemap_scan_supported’
>   127 |         if (!pagemap_scan_supported(fd))
>       |              ^~~~~~~~~~~~~~~~~~~~~~
> vm_util.c:70:13: note: declared here
>    70 | static bool pagemap_scan_supported(int fd, char *start)
>       |             ^~~~~~~~~~~~~~~~~~~~~~
> make[1]: *** [../lib.mk:224: /usr/src/perf_selftests-x86_64-rhel-9.4-kselftests-9652b82ca963243fb80e645319d473a7dc65ee79/tools/testing/selftests/mm/mremap_test] Error 1
> make[1]: *** [../lib.mk:224: /usr/src/perf_selftests-x86_64-rhel-9.4-kselftests-9652b82ca963243fb80e645319d473a7dc65ee79/tools/testing/selftests/mm/migration] Error 1
> make[1]: *** [../lib.mk:224: /usr/src/perf_selftests-x86_64-rhel-9.4-kselftests-9652b82ca963243fb80e645319d473a7dc65ee79/tools/testing/selftests/mm/khugepaged] Error 1
> make[1]: *** [../lib.mk:224: /usr/src/perf_selftests-x86_64-rhel-9.4-kselftests-9652b82ca963243fb80e645319d473a7dc65ee79/tools/testing/selftests/mm/process_madv] Error 1
> make[1]: *** [../lib.mk:224: /usr/src/perf_selftests-x86_64-rhel-9.4-kselftests-9652b82ca963243fb80e645319d473a7dc65ee79/tools/testing/selftests/mm/cow] Error 1
> make[1]: *** [../lib.mk:224: /usr/src/perf_selftests-x86_64-rhel-9.4-kselftests-9652b82ca963243fb80e645319d473a7dc65ee79/tools/testing/selftests/mm/mseal_test] Error 1
> vm_util.c: In function ‘pagemap_is_huge_zero’:
> vm_util.c:127:14: error: too few arguments to function ‘pagemap_scan_supported’
>   127 |         if (!pagemap_scan_supported(fd))
>       |              ^~~~~~~~~~~~~~~~~~~~~~
> vm_util.c:70:13: note: declared here
>    70 | static bool pagemap_scan_supported(int fd, char *start)
>       |             ^~~~~~~~~~~~~~~~~~~~~~
> make[1]: *** [../lib.mk:224: /usr/src/perf_selftests-x86_64-rhel-9.4-kselftests-9652b82ca963243fb80e645319d473a7dc65ee79/tools/testing/selftests/mm/uffd-stress] Error 1
> make[1]: *** [../lib.mk:224: /usr/src/perf_selftests-x86_64-rhel-9.4-kselftests-9652b82ca963243fb80e645319d473a7dc65ee79/tools/testing/selftests/mm/pagemap_ioctl] Error 1
> make[1]: *** [../lib.mk:224: /usr/src/perf_selftests-x86_64-rhel-9.4-kselftests-9652b82ca963243fb80e645319d473a7dc65ee79/tools/testing/selftests/mm/uffd-unit-tests] Error 1
> vm_util.c: In function ‘pagemap_is_huge_zero’:
> vm_util.c:127:14: error: too few arguments to function ‘pagemap_scan_supported’
>   127 |         if (!pagemap_scan_supported(fd))
>       |              ^~~~~~~~~~~~~~~~~~~~~~
> vm_util.c:70:13: note: declared here
>    70 | static bool pagemap_scan_supported(int fd, char *start)
>       |             ^~~~~~~~~~~~~~~~~~~~~~
> make[1]: *** [../lib.mk:224: /usr/src/perf_selftests-x86_64-rhel-9.4-kselftests-9652b82ca963243fb80e645319d473a7dc65ee79/tools/testing/selftests/mm/hmm-tests] Error 1
> make[1]: Leaving directory '/usr/src/perf_selftests-x86_64-rhel-9.4-kselftests-9652b82ca963243fb80e645319d473a7dc65ee79/tools/testing/selftests/mm'
> make: *** [Makefile:212: all] Error 2
>
>
>
> The kernel config and materials to reproduce are available at:
> https://download.01.org/0day-ci/archive/20260330/202603302149.1db397e2-lkp@intel.com
>
>
>
> --
> 0-DAY CI Kernel Test Service
> https://github.com/intel/lkp-tests/wiki
>
