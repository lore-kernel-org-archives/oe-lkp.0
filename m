Received: from mail-yw1-f182.google.com (mail-yw1-f182.google.com [209.85.128.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9DDF21BD4F8
	for <oe-lkp@lists.linux.dev>; Wed, 14 Aug 2024 19:54:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723665248; cv=none; b=hxjlQxZwO5ioEPP5FStzMZW64eaWwHsWrNOIQFntPc+8xUeihBZg8O+Q9AW8H2z+pi3wiEMhctHZK2shMaOP2IHEgGqUhaZthMNuahznfjXG3w5HulI2yn3DIA7bpmXSgXB+OAjJCkAZS61ljfr27Nzr24yNo+CokjI3LOa4L/4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723665248; c=relaxed/simple;
	bh=USwi0Rb8mFi4HxbJPJhrEmZ3yAicH/Q7+3xx3OWN7Rs=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=iRaiBr9SnAalu5YmZMnmbs5e/qVbuXSk2VDPK27Wb0I8ZvYm0prBK5WAhV7ru/ElDWG/IUK5yzLGCbsFGS/g3P7dRCtoesaGSNRSm1aOhB9kvqM/hN1DGo2zq0fQjPFKi5/Pu6uO3l9sfDLg7l4jjerw06GMwpw2mWpL2DSBpX4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=1rrzBkZD; arc=none smtp.client-ip=209.85.128.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="1rrzBkZD"
Received: by mail-yw1-f182.google.com with SMTP id 00721157ae682-66acac24443so3852617b3.1
        for <oe-lkp@lists.linux.dev>; Wed, 14 Aug 2024 12:54:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1723665245; x=1724270045; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=USwi0Rb8mFi4HxbJPJhrEmZ3yAicH/Q7+3xx3OWN7Rs=;
        b=1rrzBkZDsp00B0gzKSFOXZPvLR+HM/21J8NgbtpiomFqvQ9HS8wQGiKZl0tOikeAlW
         p/CyaI2UTAOHJgyDVplsKRbU9ZUINp8eDhHKFLbfTGncYAMzc1oaEbqQeZ2Fs2TIPVOf
         cxpDiW3CK1c0JjvY/snEJ4Q7PSSfwnAh382261y+RyMP5dv3l6smdQ97ex9o6EhRxbDW
         wF6ZFbG/TPsWcfcCp7he7wMLBi9DKtCfDuUvv5Xs3ZUGTE/0BzCfIeow74VdW5ietncd
         DN051u8kEdDwM3mea+q0cxWrOvzuUBhaKGWxUEooviqCnAUJgQAku/YSGdX/mAGTSDPU
         JA0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723665245; x=1724270045;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=USwi0Rb8mFi4HxbJPJhrEmZ3yAicH/Q7+3xx3OWN7Rs=;
        b=c2bUudHQWJTHCvQ2Fnvky8YwTVb5Q4X9RBr6BbBfW6G8tr1URwFiFlHiv0ELsWy9fx
         qW+WqWr2dUIF1qvb8MfwxS9vyByCt70pL1YX+iqJugHjD/Q0Q3N7iQDLrcQoNZAZk9yX
         UVTJzaNneUaA1RaPp02vNIS2PtpHvRKpSRkMxFrm/jWKE02DZ5LX7G/V6IveJY7a4eB5
         Q2nFiHpSWtd3PhDwDcvn5dK/ovjuZ3llfIpInE8BHa1GZjZANT7mpnwkW2NX7avqQVpi
         jB6jqCI+vNnmwEBpCC+XL03GYQc+3hRyzMGEgoC6KwatbSjp8xIVQcROe8+u/wJmbO3o
         TdeA==
X-Gm-Message-State: AOJu0YwHC2ht/pIk7O3WOHyhsFPcfhIB5U83w//IHSMeszvDLWas96M/
	dxttfhKK2LBaopBetqJPb9uKVXWOVZKZArcxSXZ5ETwU+d2Ww5GLmF37LSZwMJYuWefkntx8Xq5
	3VYhebv8JQqXCcWUbQHwcYgrCJ3dPLLel9GDC
X-Google-Smtp-Source: AGHT+IHBoP5Qns/cXTEqtDshPTGi6a9Edegb0Pk/Z7nFImN8XIv5vwuh8vf7p4qVOZ0MOnP+DPyYg7zrggtY1j3huSw=
X-Received: by 2002:a05:690c:6c8c:b0:6ad:8bbd:aec5 with SMTP id
 00721157ae682-6ad8bbdb08bmr34980907b3.14.1723665245107; Wed, 14 Aug 2024
 12:54:05 -0700 (PDT)
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
From: Suren Baghdasaryan <surenb@google.com>
Date: Wed, 14 Aug 2024 12:53:52 -0700
Message-ID: <CAJuCfpFsMjxh0kHnt4crwXRVh6_FoO=GXMwrqed-i+mFk-kmTQ@mail.gmail.com>
Subject: Need your help to check perf of a patch on different archs
To: kernel test robot <oliver.sang@intel.com>
Cc: oe-lkp@lists.linux.dev, kbuild test robot <lkp@intel.com>, 
	Mateusz Guzik <mjguzik@gmail.com>, Vlastimil Babka <vbabka@suse.cz>, Mel Gorman <mgorman@suse.de>, 
	"Liam R. Howlett" <Liam.Howlett@oracle.com>, Lorenzo Stoakes <lstoakes@gmail.com>, pedro.falcato@gmail.com
Content-Type: text/plain; charset="UTF-8"

Hi Oliver and LKP folks,
In the thread [1] Mateusz and I were investigating performance
regression caused by adjacent cacheline prefetching when we try to
move vm_lock into vm_area_struct. Mateusz thinks that my Broadwell
machine is the reason this regression is so pronounced and other
microarchitectures would not suffer as much. Would it be possible to
use your infrastructure to check that claim?
In technical terms what I need is to get results of PFT (pagefault
test) benchmark from mmtests suite [2] with and w/o the patch from [1]
from different microarchitectures. If your infra is not setup to run
PFT then any test that measures pagefault path performance would do.
Please let me know if you can help me collect this data and if you
need additional information.
Thanks,
Suren.

[1] https://lore.kernel.org/all/20240808185949.1094891-1-mjguzik@gmail.com/
[2] https://github.com/gormanm/mmtests
