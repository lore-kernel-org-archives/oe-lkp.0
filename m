Received: from mail-pj1-f74.google.com (mail-pj1-f74.google.com [209.85.216.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35EDA23AB9D
	for <oe-lkp@lists.linux.dev>; Fri, 13 Feb 2026 22:14:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771020858; cv=none; b=ojWe7oC6vV7TtlR81parxmYCemS9W+vgPnw7oGfs2aKGgldCNcyjpEyOL/ufw2r7p6Rsmo6xKrX/91R74Xx3YIYyYpZAkL2U7+yXcv1C+BlZOXKJTrDKIvwXf0/T4//DeomUov0x6yvutpFpwIbhRmyYM1Yi/sqszcXxLHwGYSo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771020858; c=relaxed/simple;
	bh=TlbzvtGr8XnIhQbW4rltHUm9mLhL6kvSJohBQlKccAE=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=SabRdFFKw9cQL08eXHoZq/ZoJNHsCR2rJIKC81AHw25CKNHcSKpFaxoVbQeDR8SEenN9G3Wq4JK05s79TAzV4b51XodAiVailkRdwdE/bovfEZvcEopzKrrFxVEf+Ag5i0nrcAgwiELpDz6+WTuxwhjVHF3S1SHJAI96ZDMA2ZI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=Hzs3fGs7; arc=none smtp.client-ip=209.85.216.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Hzs3fGs7"
Received: by mail-pj1-f74.google.com with SMTP id 98e67ed59e1d1-354c65f69edso1660181a91.0
        for <oe-lkp@lists.linux.dev>; Fri, 13 Feb 2026 14:14:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1771020856; x=1771625656; darn=lists.linux.dev;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=ZEBECFxbPjVnnnov5Njw/B7wjiS4EzKmq1acx0uh74E=;
        b=Hzs3fGs7oZMa58FbHabz+JW4LkoMWQtgGCSa5yhREEjXX2KevGVvnEBgIf3Rd8Evei
         CoSR/sDztYcvBA+sYkvVGSriyuGPWECOCmSXMQEHOpvXQbgnpBSWJ3NPzIpQ3p0xo0lQ
         BRdwFRe63h/g6e6d/MJETkrAzXplNBzegaJ1upw2umkFKfB9zkgnOCToq54wiOaBKn3f
         JjhtZBpxtx3Lnham0ZHV8GVV7crOrtN+cY5wiY9+ohZk1s7Y9wXY5CLUmFD3FvJwYWzT
         wqFqQVdvgrn6UXPe8Erd4ZozrCNgrzwb2XngjXCcm7eZxcnPqvQC8a/O1Y2qy703oneo
         LBkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771020856; x=1771625656;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ZEBECFxbPjVnnnov5Njw/B7wjiS4EzKmq1acx0uh74E=;
        b=DWpsumbFk4kXQw/8alwD18l1AQnukWCQUhTpGYSBjqdfSUM4aFmhW6XIAdy51AkwCv
         lzyc7pg/xlbgvnQ0XSN4MsCCtVoyUnXDaZRKHO7aR70kPsDlau58uz/o64Tefff4QAVC
         XQFQ+NXlumtyS0xafz6R+wSsRlH+o+a10pZRZWGoi3Mep6Wn4esYC2BuXdwpgJbnl2KY
         opdlRYxgy9wHkglS5PPtDJmuBQBtypHivfmZt1LqLkUqUQBLYzYEjFkwWgrfx8hnPHlK
         jRyS9ymtRKpoinOvRCu8jbo0HrLP6KEQkd7mGTN3pEBE2fRNkJDlQssMO9uuXhAZXmSQ
         kb2Q==
X-Forwarded-Encrypted: i=1; AJvYcCVz4Y7H5+JeTx9F5yg7Yd8KK1vx+0IPAZGotWsAPWaCYnbfaHZHvnPkqEuCsLjDTahNwx4m2HY=@lists.linux.dev
X-Gm-Message-State: AOJu0YxTaZBXsUsgcHO1oNb9xsk997Zhni1MK1Pr1HwgQT1cOvJ1b6Qk
	tD5c4RbYYFVtXLBa8QNypd7lercWhboKdLfOAnwtIIkF+VWd7uV37ntX6R6YP0BABU0UQ65/apy
	5mt1ifw==
X-Received: from pjv12.prod.google.com ([2002:a17:90b:564c:b0:34a:b8aa:69d8])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:3bce:b0:34c:c514:ee1f
 with SMTP id 98e67ed59e1d1-356aabdfed6mr2974379a91.11.1771020856470; Fri, 13
 Feb 2026 14:14:16 -0800 (PST)
Date: Fri, 13 Feb 2026 14:14:14 -0800
In-Reply-To: <20260213144417.GL3016024@noisy.programming.kicks-ass.net>
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <202602122157.4e861298-lkp@intel.com> <20260213144417.GL3016024@noisy.programming.kicks-ass.net>
Message-ID: <aY-iNnrhEj2XuRcH@google.com>
Subject: Re: [linus:master] [sched/core]  704069649b: kernel-selftests.kvm.hardware_disable_test.fail
From: Sean Christopherson <seanjc@google.com>
To: Peter Zijlstra <peterz@infradead.org>
Cc: kernel test robot <oliver.sang@intel.com>, oe-lkp@lists.linux.dev, lkp@intel.com, 
	linux-kernel@vger.kernel.org, Ingo Molnar <mingo@kernel.org>, sched-ext@lists.linux.dev, 
	aubrey.li@linux.intel.com, yu.c.chen@intel.com
Content-Type: text/plain; charset="us-ascii"

On Fri, Feb 13, 2026, Peter Zijlstra wrote:
> On Thu, Feb 12, 2026 at 10:08:04PM +0800, kernel test robot wrote:
> > Hello,
> > 
> > we found the kernel-selftests.kvm.hardware_disable_test failed consistently upon
> > this commit but pass on parent. unfortunately, we didn't find many useful
> > information in dmesg. this report is just FYI what we observed in our tests.
> > 
> > kernel test robot noticed "kernel-selftests.kvm.hardware_disable_test.fail" on:
> 
> With the caveat of PEBKAC (it is Friday after all); I can't reproduce.
> 
> That is, ./hardware_disable_test as build from cee73b1e840c, doesn't
> work for me on 704069649b5b^1 either.
> 
> Sean; is there a magic trick to operating that test, or is it a known
> trouble spot?

Hmm, shouldn't require any magic, and hasn't been known to be flaky.

This very decisively points at 704069649b5b ("sched/core: Rework
sched_class::wakeup_preempt() and rq_modified_*()"). on my end as well.  With
that commit reverted, the below runs in ~40ms total.  With 704069649b5b present,
the test constantly stalls for multiple seconds at sem_timedwait().

AFAICT, the key is to have the busy_loop() pthread affined to the same CPU as
its parent.  The KVM pieces of the selftest have nothing to do with the failure.

Here's a minimal reproducer that you can build without selftests goo :-)
E.g. `gcc -pthread -o busy busy.c` should work.

// SPDX-License-Identifier: GPL-2.0-only
#define _GNU_SOURCE

#include <fcntl.h>
#include <pthread.h>
#include <sched.h>
#include <semaphore.h>
#include <stdint.h>
#include <stdlib.h>
#include <stdio.h>
#include <sys/wait.h>
#include <unistd.h>

sem_t *sem;

static void *busy_loop(void *arg)
{
	for (;;)
		;

	return NULL;
}

static void run_test(uint32_t run)
{
	pthread_t thread;
	cpu_set_t cpuset;

	CPU_ZERO(&cpuset);
	CPU_SET(sched_getcpu(), &cpuset);

	printf("%s: [%d] spawn busy thread\n", __func__, run);
	if (pthread_create(&thread, NULL, busy_loop, (void *)NULL))
		exit(-1);

	if (pthread_setaffinity_np(thread, sizeof(cpuset), &cpuset))
		exit(-1);

	printf("%s: [%d] thread launched\n", __func__, run);
	sem_post(sem);

	pthread_join(thread, NULL);
	printf("child pthread exited prematurely\n");
	exit(-1);
}

void wait_for_child_setup(pid_t pid)
{
	/*
	 * Wait for the child to post to the semaphore, but wake up periodically
	 * to check if the child exited prematurely.
	 */
	for (;;) {
		const struct timespec wait_period = { .tv_sec = 1 };
		int status;

		if (!sem_timedwait(sem, &wait_period))
			return;

		/* Child is still running, keep waiting. */
		if (pid != waitpid(pid, &status, WNOHANG))
			continue;

		/*
		 * Child is no longer running, which is not expected.
		 *
		 * If it exited with a non-zero status, we explicitly forward
		 * the child's status in case it exited with KSFT_SKIP.
		 */
		if (WIFEXITED(status))
			exit(WEXITSTATUS(status));

		printf("Child exited unexpectedly\n");
		exit(-1);
	}
}

int main(int argc, char **argv)
{
	uint32_t i;
	int s, r;
	pid_t pid;

	sem = sem_open("vm_sem", O_CREAT | O_EXCL, 0644, 0);
	sem_unlink("vm_sem");

	for (i = 0; i < 512; ++i) {
		pid = fork();
		if (pid < 0)
			exit(-1);
		if (pid == 0)
			run_test(i); /* This function always exits */

		printf("%s: [%d] waiting semaphore\n", __func__, i);
		wait_for_child_setup(pid);

		printf("%s: [%d] do waitpid\n", __func__, i);
		r = waitpid(pid, &s, WNOHANG);
		if (r == pid) {
			printf("%s: [%d] child exited unexpectedly status: [%d]",
			       __func__, i, s);
			exit(-1);
		}
		printf("%s: [%d] killing child\n", __func__, i);
		kill(pid, SIGKILL);
	}

	sem_destroy(sem);
	exit(0);
}

