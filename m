Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5CD701DFFD
	for <oe-lkp@lists.linux.dev>; Mon, 12 Aug 2024 10:45:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723459520; cv=none; b=MMRFxiMqKPmu3FTZ7PvTuu1ycqwZx9po2Y2LtNg0On3N5qnU3BwJiMO2By+hgjLajPumFDAfk4wSn2CEipF2+LT99AsJNZVArd1wWY5AcB45tW/UFshXvX/wfSL7Np1qrVa6gi5RK+BESMcpAe7jXOfoAGB31osKFZ0RapKTFSo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723459520; c=relaxed/simple;
	bh=aXSYPpDYjkMiRfx9cPDO9/PqAFMpNe5tJmzUcQcHCCE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Q4iX/CF28uSNhnciubMhXg8fJxPv9CERH6u8nv1xxHO2RZiJDwbUwo2hHCuvn35cYOqsaVeLI+J3Z/9/o27d6vB+FIivRaaO4zl4+G2thUe9Yr0QEGbByrqJ5A8pb0/qGaAFTwtevVmh2eMezjsCPsidI6APjDazwGI95uI11qM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iMIQ2Q/D; arc=none smtp.client-ip=209.85.218.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iMIQ2Q/D"
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-a7ab76558a9so590617566b.1
        for <oe-lkp@lists.linux.dev>; Mon, 12 Aug 2024 03:45:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1723459518; x=1724064318; darn=lists.linux.dev;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=aXSYPpDYjkMiRfx9cPDO9/PqAFMpNe5tJmzUcQcHCCE=;
        b=iMIQ2Q/DLX9G4CFlczx61CtdAYh4eKGkLQPvW0xiZaZE0jHwMPa1jhIaHRSHZ5tbCu
         AiEaql8fAED4Rnk0ynVEeNPMWexfIS9po5Lt8oP0AyG4JmVh4UNS4SpjfNGO68jeUyEh
         2Fa/Rn5y8DddYSqwVK+7ukuF7sV0bxhJ+Ugh48qMYF2cnxTFKRv13Qlgm5EhoxROrYKD
         ySYKfZXDE2CP/f7YpcdeyEAEMQOVHpoNWTGbaD8+yMB81C5ko6Mya9l+pGLupzM2H84j
         hlPTVwl+Ih3IuENZhIQaJ45kwjbG2F6WyPp4SVsqq557Jb5X0pvVXGd0XBKv9FrmyWlV
         YSyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723459518; x=1724064318;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=aXSYPpDYjkMiRfx9cPDO9/PqAFMpNe5tJmzUcQcHCCE=;
        b=c4oJKUQG7lnL34spC2LvYYHhDmASEmKyvntLkDC0PJvqgxHe1zR90numPzTZmtZ9Pm
         KFah9I2e4Ov9UmJTDxKT0HhpwYwbxO0ta9pIEwMpDam7uhE+f1xok42XuwGY2l0qrMAC
         anyfG2kB8CFoqw19d+ejdkQrGILEX/suH/ofnrEFMWnovs3Sb7VzeqXVDSB77EnMQVdk
         58U0tig9I+sABav0V+NyMpk7ycJMBmrkVZxdy5gsnSqvQtUz9ytHWjH3V0QoT2cG69I8
         hC0TJgWS+K9Sks+zjB5aOwIzLfer9P8VDoix+HlK/DSaXfUIlSOC/d1rd5Q8jgIff+4R
         8rSA==
X-Gm-Message-State: AOJu0YwONp9Y7PFJwbF4rarYTcRZSEJa8QrZqEoFtO/JlclAMWvi+CF6
	TGx5c2z5TZktaOOiEnFSfW3E1Y+i+QZWTZzRFYQquWTfzp+PAvFm
X-Google-Smtp-Source: AGHT+IGw9kcm4V5e6XucUG4dMiWzIgK21S3t3dTAmwMy33GDpEMFmbAghNy61vNWHlx9aZssiPZrYQ==
X-Received: by 2002:a17:907:7ba1:b0:a7a:8284:c8d6 with SMTP id a640c23a62f3a-a80ab958547mr901598166b.24.1723459517327;
        Mon, 12 Aug 2024 03:45:17 -0700 (PDT)
Received: from f (cst-prg-72-52.cust.vodafone.cz. [46.135.72.52])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a80bb09007asm216513966b.4.2024.08.12.03.45.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Aug 2024 03:45:16 -0700 (PDT)
Date: Mon, 12 Aug 2024 12:45:04 +0200
From: Mateusz Guzik <mjguzik@gmail.com>
To: oliver.sang@intel.com
Cc: oe-lkp@lists.linux.dev, lkp@intel.com
Subject: are complete benchmark results available somewhere?
Message-ID: <ahhsblwfjo6he4xnxdztjcscvuc7zhevbx4nnxneyh7qstietr@oei4nio6223d>
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

I only found results for performance changes, nothing abut the current
state of things for any particular kernel and/or machine.

If this info is not pubicly available as is, can you do me a favor and a
one off send me a set of results + profiles for the biggest machine you
test on?

thanks
