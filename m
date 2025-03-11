Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com [209.85.167.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4F461DE894
	for <oe-lkp@lists.linux.dev>; Tue, 11 Mar 2025 12:43:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741697030; cv=none; b=dRoN6cWerGlxepze1bLz6K2+IzGZ0OkVpeioc5AcGE9rDUYsBzZ0yMw/xmehXAlR6DePahGCuyYtFZj9RkAlHp1s/Y2FuuFhRqF+kg+U26Ufq41UKkCfsx3WJkAAzVWhWzdIlu3eY4AbxEjMNIYn/4ZZUPYkFXpGdsKdwJEns5A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741697030; c=relaxed/simple;
	bh=nhm1qov2cjbVTuQ1zPuXkoXY6mfoUiUkB97FkVTBUa8=;
	h=From:Date:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UHgRsV5KgFgIERg07kMRfq5YqAg5O4mpivRToZuLdCitFcExCXZMWM8njAb5Bf2IKbB7MnrfubCnEneOADjrtzBBGoqeMXOkOTUMBvypDHYbiIMkciwJNOyvt5TegpGHpQ9DD9q+TcllAbv5BGcdCouuVXKss8nTybScjqwtvIA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HlcMpibO; arc=none smtp.client-ip=209.85.167.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HlcMpibO"
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-54298ec925bso7131476e87.3
        for <oe-lkp@lists.linux.dev>; Tue, 11 Mar 2025 05:43:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741697027; x=1742301827; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=HTCL8cCV9Yv5a4HKPg2F9Qp9sd+Hn4LCj6V++NX0Kn8=;
        b=HlcMpibOr02+r0U3t1RuzK98cqeJWJzIo36W5OT3KVD4/JnDzGdR97qBK8Bc3lWLh7
         B7lkm98zNp2j3z4WUi4+4vzjZPHOd1zo4HWfmegRLtLYdCK4mNkZ+QoYPtcnmFQauJge
         IQHF6L5VsG6JGR7yQiuST+GsbcIBpkH04/v5o22b9dRONoUXspxX+LIpbXf07ij2XS/J
         DjelPtPKR4zZMbuMW+Bqso+JUVEoZs9+GF/7TR9cXWFBs6gbkwOGh+M+OXR7y1zCiOhY
         hA+b5y6kTunEhMH+A4Iq32tEEZ1A2GLOWQFqzLLLqSsT+loAnOyNMTHRmKo21V/DzCsQ
         MNDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741697027; x=1742301827;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HTCL8cCV9Yv5a4HKPg2F9Qp9sd+Hn4LCj6V++NX0Kn8=;
        b=ukBdz9+H3EuardKYWINdVsEhFF2fz1e4x8q47ZU4D1cI8/DxfUwvbuELKPbZ6r7t7i
         4N7vh7mKibXLZ+jkCKjadGhHhiASlrbV/MaaC8zeD8/YNguWZjtevp+gaZGzEH2kgPek
         rp+clltZpj/g1Get2judyQCZJuIs75hydHRrc5qN1b+ZEGLz7rmsZyPDDcaFtfhWbzkW
         1GaFNKmSoYBx/aLLa2iE8zuPrUA1ZePLZIle2+IMoiJUan5Atg5PbGGLhSUjOsgOppCW
         6EctEyLXSxQ5ACKdiCoMbV5K8UfQw478YNm42x/ggZ8DAPmdDLaLzAsFkCRB6RuCz+y6
         DjUw==
X-Forwarded-Encrypted: i=1; AJvYcCWA1XtrmyavSsQOjq1Y9YaN4JXrj97+6pW3yG5JR1C0psJMjCZGNRCy3Cgrzzt5aJ65GmGcvX4=@lists.linux.dev
X-Gm-Message-State: AOJu0YxRzP1N+brteiZYQyyqBHT2MxVPIC/lIbFt5ENoNeX7/38fOOaA
	t3IKN7JmgC8HdnJxPHlGmPxhEG77M1o98/LRTQE6CZypkMp2bdvr
X-Gm-Gg: ASbGncuvVtn9xjaqUGOriR4tRXntroc0mFceiUjYePDQ9JhkAn809Tn4VeVr4C2/5QT
	FNt+vur9iwLPe7EXXbdK0pQlvzp7IlrE7XxLNdlu0DHDsNowAsXj+P/tb0+T+Kv9eChnXeC6IvG
	vYo7DC6zwBSrgbfj6Pm+5qtSsIxu87z7aGz2WKBVAL0cTaXDl6X9Noa8WR649rZZW3OwhYSt5ru
	263KLgxEnDZHJDX9nwqw5cH7wzCjJsTzlSwLi9tNx7gmbFXR3r25tOocC6qbxj/X+i6otd8TH2z
	37rRbiTly+M+W1B+dw6Wu3SB5rKGBJiWajULUrh0tyOO6LjIJZKomt6wHncjqSxONzM=
X-Google-Smtp-Source: AGHT+IG/eJN+/b36KEj7HaDNA80rUtHVDdahkUmHLNRR/XVgvniYMiqXwe4uoIDyfwVd5BiDFMcEtg==
X-Received: by 2002:a05:6512:4011:b0:545:b28:2fa9 with SMTP id 2adb3069b0e04-54990e5d970mr6889375e87.16.1741697026780;
        Tue, 11 Mar 2025 05:43:46 -0700 (PDT)
Received: from pc636 (host-95-203-6-24.mobileonline.telia.com. [95.203.6.24])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5498ae461a5sm1753434e87.23.2025.03.11.05.43.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Mar 2025 05:43:46 -0700 (PDT)
From: Uladzislau Rezki <urezki@gmail.com>
X-Google-Original-From: Uladzislau Rezki <urezki@pc636>
Date: Tue, 11 Mar 2025 13:43:44 +0100
To: Andrew Morton <akpm@linux-foundation.org>
Cc: liuye <liuye@kylinos.cn>, Andrew Morton <akpm@linux-foundation.org>,
	oe-lkp@lists.linux.dev, lkp@intel.com,
	Christop Hellwig <hch@infradead.org>, linux-mm@kvack.org
Subject: Re: [linux-next:master] [mm/vmalloc] ff6f2b81ea:
 WARNING:at_kernel/fork.c:#vm_area_init_from
Message-ID: <Z9AwAKYI92AgIJ8M@pc636>
References: <202503101629.7289b1-lkp@intel.com>
 <Z88Y4KcvjcskC5TW@pc636>
 <e563f63c-a37f-4405-921f-6da6c9709788@kylinos.cn>
 <Z9APeowHOXe-MkV2@pc636>
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z9APeowHOXe-MkV2@pc636>

Hello, Andrew!

> > > 
> > >>
> > >> Hello,
> > >>
> > >> kernel test robot noticed "WARNING:at_kernel/fork.c:#vm_area_init_from" on:
> > >>
> > >> commit: ff6f2b81eaa8a9fe5d158c6e7b1e58d3929c32c1 ("mm/vmalloc: move free_vm_area(area) from the __vmalloc_area_node function to the __vmalloc_node_range_noprof function")
> > >> https://git.kernel.org/cgit/linux/kernel/git/next/linux-next.git master
> > >>
> > >> [test failed on linux-next/master 0a2f889128969dab41861b6e40111aa03dc57014]
> > >>
> > >> in testcase: trinity
> > >> version: 
> > >> with following parameters:
> > >>
> > >> 	runtime: 300s
> > >> 	group: group-02
> > >> 	nr_groups: 5
> > >>
> > >>
> > >>
> > >> config: x86_64-randconfig-101-20250306
> > >> compiler: gcc-12
> > >> test machine: qemu-system-x86_64 -enable-kvm -cpu SandyBridge -smp 2 -m 16G
> > >>
> > >> (please refer to attached dmesg/kmsg for entire log/backtrace)
> > >>
>
Could you please share your view what we should do with the patch in
question? I mean we can drop it, since it is broken and there is also
another option - it is to fix the broken patch.

Thank you in advance!

--
Uladzislau Rezki
