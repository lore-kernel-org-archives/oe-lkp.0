Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B0712288CB
	for <oe-lkp@lists.linux.dev>; Tue, 30 Dec 2025 21:07:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767128839; cv=none; b=iTCknTV+pdGuQKylfMjJ93QkeT9LAWlGKyHHdHEBA8oCmkVv4FHwyszfqN7OFPruI/C6AyAz3UycIxYOvqclrFK4cw2p8KM0o8IMFN8FjYyslcS9q8bWLzffmKDJyNyQCtqOjnLlHgJdH89Wu0CCWLwRMgJ5QSd2YuGBYPGz3Z0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767128839; c=relaxed/simple;
	bh=buFLvgqPk07T/IK64g26n1eo7lJtPO3A+e/41msTbVI=;
	h=Message-ID:Date:MIME-Version:To:Cc:From:Subject:Content-Type; b=M5Jd842Vrx3jrrDv/pdRjisilFmP65vY4W+Z+hnODf9OD/46yiGzpGOxxcT2AsqiCXvDBkN5w/+PoGbliDzpycgwp/k5WYMSKdM3nCR+qpPVKb+9kG7OHm0a6r0wnUun75bIfO5UwOnvT5JKIkzLf1cherfKyHrdSi6Nx7NB8v8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=NBU2viI4; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="NBU2viI4"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1767128837;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=Fs3dF5XgyMuZpukt7W4gv9P8n3NBqDsrPfX7SygV9BU=;
	b=NBU2viI45HrpIe8CjDci1jUPam9wrGVHM8s7Nm8P+vgdkc8hy/IBM6Tt1yFRYuiqMqajkI
	q+LeKpzh2lx6H1jhjwapx9lg8yu38wZpRpqT5GE4WJiMaapcSgFVD1CrvbT0fM7kD1XLlh
	9NjHISOiqE3Fs6Me569anOGcM/CS6AA=
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com
 [209.85.160.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-204-B9r5eQxNPR-KFHncsgsY-Q-1; Tue, 30 Dec 2025 16:07:13 -0500
X-MC-Unique: B9r5eQxNPR-KFHncsgsY-Q-1
X-Mimecast-MFC-AGG-ID: B9r5eQxNPR-KFHncsgsY-Q_1767128833
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-4ed6855557aso233994601cf.1
        for <oe-lkp@lists.linux.dev>; Tue, 30 Dec 2025 13:07:13 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767128833; x=1767733633;
        h=content-transfer-encoding:subject:from:cc:to:content-language
         :user-agent:mime-version:date:message-id:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Fs3dF5XgyMuZpukt7W4gv9P8n3NBqDsrPfX7SygV9BU=;
        b=kFCbaUNg+ctvy4wDqF+/BGjjPzNk+XZjZ2rJiE+1y5eRdkLI45h4qPlp3dXElJVkK1
         jFgq5RX+Vnf8P6qtdpluYFqsfL6fXpd5juPzjSDEA/MDwzIyENfiO9JvMN1FFaGwKnVZ
         hsKOqYSlyo04n5Z40GT3spqFJI0/nFU8uqQ3jsZe0Z5aLjsiXE+LZwSi7csV079YzbIY
         gxYtFyt6M7ygo8b4BsyRtaFctMbpflsvVoZh8sufau1eovJjf8M936Sj/J3bWg7TEBgK
         +A4nTMjLJdThf926/cz46R5Qusfo9S3Azof3NZKeS4VMrMJassfAKpjU5juOr/MzoJDs
         fzTQ==
X-Forwarded-Encrypted: i=1; AJvYcCXhw9XoWXEf8CE8P6MkxBZrbzuAMTkUrwJF2G6UAyfmtqvyg8te4TaD2PHsxtNVw/PcwzrQoM0=@lists.linux.dev
X-Gm-Message-State: AOJu0Ywper0pG0NitzLjJwu6ncm/NCPBkUHAU2qvmGeldm8Hq2tyiLms
	5MWNGm5MSR5L5al75ilBoSRG1oOgKXdbKKMpWkceH3eAm8NQpfyWOf2X+BZzazi7PS5Gb/v61SN
	5w/t8XH+Pi84NX1WlnIBMGNJuOlYJ00zNBusuyymmMj2aeMClS7RCVd4Dew==
X-Gm-Gg: AY/fxX5vIS1emi6iPG+/beuiyfZXi0dsQVJq8r35IUzuuk5SbAYCHunX2tcy+TmawLl
	aYryxyKkBF8U8meTI+V0K//mpPJClmeQzk7nGB1SsquNk+Hhqt2fZkDoxWlp/QNJSQPPsYMTjQb
	do1YirvqvH8drhztMxqnCGtwWRKBfOpYuvn8zICiZmFfs2QZlaI0mxt5brfDdDgIYQTe+GQKsvu
	9fUUNUc4ilkOBoukPEJr1NDWDOzcTvXA3DpAsmCCpqeeXYnZr1d5+3mbWomuSR2p5BW3wTAM6rz
	8otbPkgmCv1X7hR2nwX2s7znLHw2H69ZpG254Lp1019UYoNlwwGFvTGWjg+cbcHih3weBhNqfQn
	FtU9DkaCMTIO5h4TG3ke76ZuDmXG/0xuSvEkXzsKxCp+SmnUIdTJE
X-Received: by 2002:ac8:5812:0:b0:4e7:4a3:ae88 with SMTP id d75a77b69052e-4f4aac5d21bmr505336041cf.7.1767128832989;
        Tue, 30 Dec 2025 13:07:12 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGniPugfrtKUmrAdsMvFifGxehdYRRZoaKgkEFfGSz35yFouArtimGZRwcWQsxAfpgWRHElYg==
X-Received: by 2002:ac8:5812:0:b0:4e7:4a3:ae88 with SMTP id d75a77b69052e-4f4aac5d21bmr505335751cf.7.1767128832539;
        Tue, 30 Dec 2025 13:07:12 -0800 (PST)
Received: from [10.0.0.82] (97-127-77-149.mpls.qwest.net. [97.127.77.149])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4f4ac66841bsm242201241cf.30.2025.12.30.13.07.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 30 Dec 2025 13:07:12 -0800 (PST)
Message-ID: <9fbb6bf2-70ae-4d49-9221-751d28dcfd1a@redhat.com>
Date: Tue, 30 Dec 2025 15:07:10 -0600
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: linux-fsdevel <linux-fsdevel@vger.kernel.org>,
 linux-kernel@vger.kernel.org
Cc: Christian Brauner <brauner@kernel.org>,
 David Howells <dhowells@redhat.com>, lkp@intel.com, oe-lkp@lists.linux.dev,
 Alexander Viro <aviro@redhat.com>
From: Eric Sandeen <sandeen@redhat.com>
Subject: [PATCH RFC] fs: cache-align lock_class_keys in struct
 file_system_type
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: vfjON8Zk3w9VKD8-g-BFQpyGxeuonS7yOpMlU9rtsR4_1767128833
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

LKP reported that one of their tests was failing to even boot with my
"old mount API code" removal patch. The test was booting an i386 kernel
under QEMU, with lockdep enabled. Rather than a functional failure, it
seemed to have been slowed to a crawl and eventually timed out.

I narrowed the problem down to the removal of the ->mount op from
file_system_type, which changed structure alignment and seems to have
caused cacheline issues with this structure. Annotating the alignment
fixes the problem for me.

Reported-by: kernel test robot <oliver.sang@intel.com>
Closes: https://lore.kernel.org/oe-lkp/202512230315.1717476b-lkp@intel.com
Fixes: 51a146e05 ("fs: Remove internal old mount API code")
Signed-off-by: Eric Sandeen <sandeen@redhat.com>
---

RFC because I honestly don't understand why this should be so critical,
especially the structure was not explicitly (or even very well) aligned
before. I would welcome insights from folks who are smarter than me!

diff --git a/include/linux/fs.h b/include/linux/fs.h
index 9949d253e5aa..b3d8cad15de1 100644
--- a/include/linux/fs.h
+++ b/include/linux/fs.h
@@ -2279,7 +2279,7 @@ struct file_system_type {
 	struct file_system_type * next;
 	struct hlist_head fs_supers;
 
-	struct lock_class_key s_lock_key;
+	struct lock_class_key s_lock_key ____cacheline_aligned;
 	struct lock_class_key s_umount_key;
 	struct lock_class_key s_vfs_rename_key;
 	struct lock_class_key s_writers_key[SB_FREEZE_LEVELS];

