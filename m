Received: from mail-pg1-f202.google.com (mail-pg1-f202.google.com [209.85.215.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F11A93E9C06
	for <oe-lkp@lists.linux.dev>; Thu, 21 May 2026 14:28:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779373724; cv=none; b=SA4ymXI0bYXXmIeJdoxi94xvlNp2UKZ9nkrYhXQNPPifhJ7tHVX6SJtdQEF5dE6OUPf8ZUPyzIqeY43fwZftsa9Vvrp17D2g5gejMU5lXLVK4fOjLIWVaoDmBiBwfUV2e6vdfCOQ9BG0btYLmWUk8mwBPDnkYroV5YmyPrF58Cg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779373724; c=relaxed/simple;
	bh=EUTY7c/wQ6odBf0NG7I5Wy1BmLLq056ywAdcPvlK/DM=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=D6gN2CmqFWW7cxTDGAm1GT35rAmhNNymqJJyXOTIpKQ/mzeK9H75d6lprDKI9eaw3DfTRAlT5ycA3snhY3LOrY02kxlMO+gaCzd7f5BFB1j+jAO36NKTFohSzY/27e6/B6WwwaRAxBWn3PT7V36ax8x61YwhfanmYBULun91DLo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=RBwtdJ3L; arc=none smtp.client-ip=209.85.215.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="RBwtdJ3L"
Received: by mail-pg1-f202.google.com with SMTP id 41be03b00d2f7-c70ea91bfe1so3518700a12.1
        for <oe-lkp@lists.linux.dev>; Thu, 21 May 2026 07:28:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1779373722; x=1779978522; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Qpfg2DB42qQ3bvRNWMtAmmCZ15+qKS/M5NjmIWYN8UU=;
        b=RBwtdJ3LssYHRPrLsfC8avq1DRHSFyHcoBu2lmj7gjn3DBZ2zHx0HgQ6LQN4clbZbW
         ueywHC8HOQXNejYLoDmY/J1k86O0jytUkfxcOY4TMdGqKqBXV0QDVFAqHvNvCsaHk7B2
         VLXYlLIUyqSlcIjIB0aywf1hlKdTdTYIs53sh1orIbJyqvz5RBqnbh+Pi9uPgOG/AEGf
         olBVnHurF3MhMJnHjp38xapSe3jbZraDCRwuLEEn25Q/ykRiDPaY+abVTfQKjbL5b6X0
         etmgsRRjmIsY6Rbu3n9P6c2dmyWVZpEixY4GPuim8GtRywg427CXPJECg7cLKsBQN6Ys
         MNBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779373722; x=1779978522;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=Qpfg2DB42qQ3bvRNWMtAmmCZ15+qKS/M5NjmIWYN8UU=;
        b=bwo/c6TWYhZlWOBwPA3dzLLLy5pbFndpNdWrtipT4S47vSzQRj/QCd7ZU3gVqiS8EV
         RosIO5wtNOX6L9SOvzrUdOrXWb48pz95VdOXdkauiZ2CSOzjKH+msb+AdowVsZVFPhmu
         UWNsVbqn6UdB3lwPjIynqK18Mfdlxj3pHFgVkag52q66zT9KtjoSxhXUbcuEMOeSO8JB
         gysHqWg0mdIm8gP5OqazxorFOzvTlp3k2nilVdd2OC/UXKiOhw/EzDt+IOhrEfLjimH/
         +NoPy/DJHRtkSxxA+JuFyN/XNsnmwd3tfFgz/bAutUExQGYL9NpwkGHuzHViTL21ZnSl
         e7Ow==
X-Gm-Message-State: AOJu0Yz39tLEyjMUUaFW3AMj2Fa1Ssc6kf1/+K8oMYuWQRAmdEREox51
	Xmx+KTxdOlsn+QObSUZxqQbfkvTyJiY+a2u7Qu2p6PABff9hidTc8rQXDw8wuLPHMyXdIRFV/kM
	wc1TqsA==
X-Received: from pgly11.prod.google.com ([2002:a63:180b:0:b0:c82:cd84:79d])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a20:6a0a:b0:3a2:d79c:4149
 with SMTP id adf61e73a8af0-3b3087f5270mr3919162637.28.1779373721947; Thu, 21
 May 2026 07:28:41 -0700 (PDT)
Date: Thu, 21 May 2026 07:28:41 -0700
In-Reply-To: <202605210807.f147e0c4-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20260501203537.2120074-3-seanjc@google.com> <202605210807.f147e0c4-lkp@intel.com>
Message-ID: <ag8WmcdDjxkpbzXi@google.com>
Subject: Re: [PATCH v2 2/6] KVM: selftests: Add a test to verify SEV {en,de}crypt
From: Sean Christopherson <seanjc@google.com>
To: kernel test robot <oliver.sang@intel.com>
Cc: oe-lkp@lists.linux.dev, lkp@intel.com, kvm@vger.kernel.org, 
	Paolo Bonzini <pbonzini@redhat.com>, linux-kernel@vger.kernel.org, 
	Ashutosh Desai <ashutoshdesai993@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

On Thu, May 21, 2026, kernel test robot wrote:
>=20
>=20
> Hello,
>=20
> kernel test robot noticed "kernel-selftests.kvm.make.fail" on:
>=20
> commit: f6ed3165a8ced57973a0919d0ead11eaff393477 ("[PATCH v2 2/6] KVM: se=
lftests: Add a test to verify SEV {en,de}crypt")

Ah, this is a local commit, from applying the patch.  I fixed up the semant=
ic
conflict when applying, i.e. I did NOT botch 6edd35e77a42 ("KVM: selftests:=
 Add a
test to verify SEV {en,de}crypt debug ioctls"). :-)

> url: https://github.com/intel-lab-lkp/linux/commits/Sean-Christopherson/K=
VM-SVM-Fix-page-overflow-in-sev_dbg_crypt-for-ENCRYPT-path/20260502-190513
> patch link: https://lore.kernel.org/all/20260501203537.2120074-3-seanjc@g=
oogle.com/
> patch subject: [PATCH v2 2/6] KVM: selftests: Add a test to verify SEV {e=
n,de}crypt
>=20
> in testcase: kernel-selftests
> version: kernel-selftests-x86_64-917719c412c4-1_20260508
> with following parameters:
>=20
> 	group: kvm
>=20
>=20
> config: x86_64-rhel-9.4-kselftests
> compiler: gcc-14
> test machine: 16 threads Intel(R) Core(TM) i7-13620H (Raptor Lake) with 3=
2G memory
>=20
> (please refer to attached dmesg/kmsg for entire log/backtrace)
>=20
>=20
>=20
>=20
> If you fix the issue in a separate patch/commit (i.e. not just a new vers=
ion of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <oliver.sang@intel.com>
> | Closes: https://lore.kernel.org/oe-lkp/202605210807.f147e0c4-lkp@intel.=
com
>=20
>=20
> gcc -D_GNU_SOURCE=3D -I/usr/src/perf_selftests-x86_64-rhel-9.4-kselftests=
-f6ed3165a8ced57973a0919d0ead11eaff393477/tools/testing/selftests/../../../=
tools/testing/selftests  -I/usr/src/perf_selftests-x86_64-rhel-9.4-kselftes=
ts-f6ed3165a8ced57973a0919d0ead11eaff393477/tools/testing/selftests/cgroup/=
lib/include -Wall -Wstrict-prototypes -Wuninitialized -O2 -g -std=3Dgnu99 -=
Wno-gnu-variable-sized-type-not-at-end -MD -MP -DCONFIG_64BIT -U_FORTIFY_SO=
URCE -fno-builtin-memcmp -fno-builtin-memcpy -fno-builtin-memset -fno-built=
in-strnlen -fno-stack-protector -fno-PIE -fno-strict-aliasing -I/usr/src/pe=
rf_selftests-x86_64-rhel-9.4-kselftests-f6ed3165a8ced57973a0919d0ead11eaff3=
93477/tools/testing/selftests/../../../tools/include -I/usr/src/perf_selfte=
sts-x86_64-rhel-9.4-kselftests-f6ed3165a8ced57973a0919d0ead11eaff393477/too=
ls/testing/selftests/../../../tools/arch/x86/include -I/usr/src/perf_selfte=
sts-x86_64-rhel-9.4-kselftests-f6ed3165a8ced57973a0919d0ead11eaff393477/too=
ls/testing/selftests/../../../usr/include/ -Iinclude -I. -Iinclude/x86 -I .=
./rseq -I..  -isystem /usr/src/perf_selftests-x86_64-rhel-9.4-kselftests-f6=
ed3165a8ced57973a0919d0ead11eaff393477/usr/include -march=3Dx86-64-v2   -c =
dirty_log_perf_test.c -o /usr/src/perf_selftests-x86_64-rhel-9.4-kselftests=
-f6ed3165a8ced57973a0919d0ead11eaff393477/tools/testing/selftests/kvm/dirty=
_log_perf_test.o
> x86/sev_dbg_test.c: In function =E2=80=98test_sev_dbg=E2=80=99:
> x86/sev_dbg_test.c:85:33: error: implicit declaration of function =E2=80=
=98vm_vaddr_alloc=E2=80=99 [-Wimplicit-function-declaration]
>    85 |         data =3D addr_gva2hva(vm, vm_vaddr_alloc(vm, BUFFER_SIZE,=
 KVM_UTIL_MIN_VADDR));
>       |                                 ^~~~~~~~~~~~~~
> At top level:
> cc1: note: unrecognized command-line option =E2=80=98-Wno-gnu-variable-si=
zed-type-not-at-end=E2=80=99 may have been intended to silence earlier diag=
nostics
> make[1]: *** [Makefile.kvm:329: /usr/src/perf_selftests-x86_64-rhel-9.4-k=
selftests-f6ed3165a8ced57973a0919d0ead11eaff393477/tools/testing/selftests/=
kvm/x86/sev_dbg_test.o] Error 1
> make[1]: *** Waiting for unfinished jobs....
> make[1]: Leaving directory '/usr/src/perf_selftests-x86_64-rhel-9.4-kself=
tests-f6ed3165a8ced57973a0919d0ead11eaff393477/tools/testing/selftests/kvm'
> make: *** [Makefile:217: all] Error 2
>=20
>=20
>=20
> The kernel config and materials to reproduce are available at:
> https://download.01.org/0day-ci/archive/20260521/202605210807.f147e0c4-lk=
p@intel.com
>=20
>=20
>=20
> --=20
> 0-DAY CI Kernel Test Service
> https://github.com/intel/lkp-tests/wiki
>=20
