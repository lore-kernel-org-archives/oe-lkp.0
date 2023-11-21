Received: from mail-oi1-f181.google.com (mail-oi1-f181.google.com [209.85.167.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7C3E22090
	for <oe-lkp@lists.linux.dev>; Tue, 21 Nov 2023 18:29:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="W5XbOjrX"
Received: by mail-oi1-f181.google.com with SMTP id 5614622812f47-3b6d80daae8so3863512b6e.2
        for <oe-lkp@lists.linux.dev>; Tue, 21 Nov 2023 10:29:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1700591344; x=1701196144; darn=lists.linux.dev;
        h=in-reply-to:subject:cc:to:from:message-id:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=ncCIxcs/xVLPnGvcaXoyTXXdbTA4XUJvEc6jXEcdnbY=;
        b=W5XbOjrXTDlkvV7K5OOI8Wj6cH2X2SRK2t6pdOlhjBBPHv2YA7lNDJQrD7r7Xdzuqw
         mq6EDxwqsy7nnAC8YQ8F8nOhSZ3FOThQaVD15sB8LqIlwEAVdPqjOhPe2hmgxK7tPXAn
         QrrTWK4h8WsHglDhhZc7BGOifhtPpIeQM2gHCvXAVQvsh/4WETdFjCIahNS+uxDEYtMV
         6LoyRJiNQOTYhYRNLTp8kxDrH13DrMXChDXqD/tMAxKhSq8UncaOYw034H9fn26neQiE
         ynYDRyZnJAftZ/lToW8tfumTOtayDZbmLoBN/lv98zexplhmSW3Juej9Xy3cGL4bjeAT
         oNrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700591344; x=1701196144;
        h=in-reply-to:subject:cc:to:from:message-id:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ncCIxcs/xVLPnGvcaXoyTXXdbTA4XUJvEc6jXEcdnbY=;
        b=gk7i7axmMdFmsvDG4WD59aL4SSjGVyWYDe9cuVURuRW9wWyijHI4wPOmHdji8SesxS
         wosKm5rp/45s+m7sfQUgTs6rdTiJs+Y3R91NcVNcdgfV0KCBm6QWPDcuBmrUpRB4166h
         Lt3pv1YftAkcVs4fkf9ryAKUgbmpYkNUPecPT6/BXl3OpsYaOAiF13BmMPV4ItoVKRNG
         L0ABp5X/fkZ8uBnbPkETQTFUPP6cOXB1D+X6OKyv3F0HXE9A0jnYxDxhpgZkkCVDrgsh
         U1EYrkZZbfUrkthEGsKLx5UOD5OhXdqf5xtgDCaL3i9Vek+9uV/pgpVXiCgVMFNbEcjg
         UKvA==
X-Gm-Message-State: AOJu0YzQ9Pi/xi+IzDHyjK1eU9A5xqFTHpM2ZqM/BeCcY6GnZ6sYA0na
	qw6YQejBZxX1SjXtLhBhMWo=
X-Google-Smtp-Source: AGHT+IHlyuDisIhQj/U16OiyMIa+UvOVHhFklkEjm00h/DBpWhY2Hbw43NVFiuJhRteAolGAgujRjA==
X-Received: by 2002:a05:6808:8da:b0:3b6:4ee:49c8 with SMTP id k26-20020a05680808da00b003b604ee49c8mr94279oij.54.1700591344685;
        Tue, 21 Nov 2023 10:29:04 -0800 (PST)
Received: from dw-tp ([49.205.218.89])
        by smtp.gmail.com with ESMTPSA id t5-20020a6564c5000000b005aa800c149bsm7049448pgv.39.2023.11.21.10.29.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Nov 2023 10:29:03 -0800 (PST)
Date: Tue, 21 Nov 2023 23:58:55 +0530
Message-Id: <87zfz7dkpk.fsf@doe.com>
From: Ritesh Harjani (IBM) <ritesh.list@gmail.com>
To: kernel test robot <oliver.sang@intel.com>
Cc: oe-lkp@lists.linux.dev, lkp@intel.com, linux-kernel@vger.kernel.org, linux-ext4@vger.kernel.org, oliver.sang@intel.com, Jan Kara <jack@suse.cz>
Subject: Re: [linus:master] [ext2]  bc943f4872: xfstests.generic.269.fail
In-Reply-To: <202311211653.3a9e8678-oliver.sang@intel.com>
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>

kernel test robot <oliver.sang@intel.com> writes:

> Hello,
>
> kernel test robot noticed "xfstests.generic.269.fail" on:
>

generic/269 is a ENOSPC with fsstress. There is a recent fix made to
this testcase [1]. Could it be that you are missing generic/269 fix in
your tree? xfstests recently got updated here [2].

[1]: https://lore.kernel.org/fstests/169687552545.3948976.16961989033707045098.stgit@frogsfrogsfrogs/

[2]: https://lore.kernel.org/fstests/5fbaeebad0ffc8fc6944b35631ebc117.Zorro%20Lang%20%3Czlang@kernel.org/

-ritesh
