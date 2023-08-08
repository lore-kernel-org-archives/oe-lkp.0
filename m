Received: from mail-oa1-f48.google.com (mail-oa1-f48.google.com [209.85.160.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54F66100B9
	for <oe-lkp@lists.linux.dev>; Tue,  8 Aug 2023 15:25:53 +0000 (UTC)
Received: by mail-oa1-f48.google.com with SMTP id 586e51a60fabf-1bf7eb259d5so3398758fac.0
        for <oe-lkp@lists.linux.dev>; Tue, 08 Aug 2023 08:25:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1691508352; x=1692113152;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=8lD/uFf0wow5CQnaoK2oNS4fXZVxBqZ6WPF6m6974ic=;
        b=aI++BbuTlAj5+FHmXXwIqe/rtapeZ85K0wiMRXyJJTKl6SpBvd+unMEHu0Gdq3LK8L
         pzNMzUP4CaP5r5SkYbyIQTAaAsH+VeggB5LBI5jVCN7mZQdG2V4F+Ib8wmOfW0RYSAtU
         fyQCfXQHeD2pQqWOXXH7ccsQMmKIMSyspFhq7U/Hen+4XOu/0NQDxeYgdonhfRrSXrTr
         FER3HCYOYF1AWwHIS6hMvsTGN3PXB5i2mNrm8KqWFfdfMLh+2/P4vP5u9K3NSvuy79Hp
         6wvzbgjcYdrOS+Jr6NsbSPcmjSYNDDdizb+ahzRbFMZXaH8GWnP2QwfPpj+LBNk6U7gn
         jbmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691508352; x=1692113152;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=8lD/uFf0wow5CQnaoK2oNS4fXZVxBqZ6WPF6m6974ic=;
        b=C1ErxQRNiu1Wnkz7jiM24o7X2TLW0p9ny7JBEmE9l5TLriHX1Lt5oSgQ0+Rks7lspr
         aHCB5iwGv25AhnPzQ9VR85WZKYRKXLVII0Fpv6xSLQ3ivk83YdEo7OVJOtH1DLmAlfYt
         OxiQMeLZxMnHAuaNYUxTxGrskTraJEZXQdpYAT7uvlgEug24bUnqUNrkfFliHrZJTqNA
         6A90P7SCgTaqu3q1snvtaBIkKZpuprPg+q1vlcSXAnPLwxAhe3uOrjcmUFldx+S83IAk
         HQ1M0K5NbQCS8t5zcmM20SDu3Iyd14JAS5fVzhxSyEOlz1RC8e0GjUAwUW3eHXSySIBL
         T3wg==
X-Gm-Message-State: AOJu0Yw4/UhX9OoZT1QdUomgKPSFlgvzldrwKCI2/qPlawHDzMIRJwBa
	c/snhWrvggjKIGmlwxXV4beqzG3niKlP+4nrBH0=
X-Google-Smtp-Source: AGHT+IHIUVZJ/nIc/PQpNO8vLS/kFvAT1qhSoXUuIxgrtCAvvHN92UdSpESsLnSJlhh1n5DzvC73oCMwFPZeuLKkFE4=
X-Received: by 2002:a05:6871:5225:b0:1b0:4349:b825 with SMTP id
 ht37-20020a056871522500b001b04349b825mr9736850oac.21.1691508352081; Tue, 08
 Aug 2023 08:25:52 -0700 (PDT)
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Received: by 2002:ac9:5f85:0:b0:4e5:e74a:3a76 with HTTP; Tue, 8 Aug 2023
 08:25:51 -0700 (PDT)
From: Mateusz Guzik <mjguzik@gmail.com>
Date: Tue, 8 Aug 2023 17:25:51 +0200
Message-ID: <CAGudoHGyo4WPjXLfhzCOn1gK6nvx2U1Z=Dh4xcBw6yXZ30p-AA@mail.gmail.com>
Subject: hardening and other opts in kernel config used for benchmarking?
To: ying.huang@intel.com, feng.tang@intel.com, fengwei.yin@intel.com
Cc: oe-lkp@lists.linux.dev, lkp@intel.com, linux-kernel@vger.kernel.org, 
	Linus Torvalds <torvalds@linux-foundation.org>, Christian Brauner <brauner@kernel.org>
Content-Type: text/plain; charset="UTF-8"

Hello,

I have no idea who should be in To: or Cc:, I grabbed names from an
e-mail I got regarding one of previous changes.

Recently I benchmarked a change which added unconditional file
position locking and found a minor regression from it (with profiler
output to justify it):
https://lore.kernel.org/linux-fsdevel/CAHk-=whJtLkYwEFTS9LcRiMjSqq_xswDeXo7hYNWT0Em6nL4Sw@mail.gmail.com/T/#m7c0cd6e913c6295732daea3c88f502bd4724ffb3

However, according to Christian the change was benchmarked by your
machinery and no difference was found.

I briefly poked around and found that used configs have:
CONFIG_RANDOMIZE_KSTACK_OFFSET=y

This is an optional and very expensive hardening feature, my question
is if it was enabled on purpose. The cost comes from adding rdtsc to
every syscall.

Looking at the rest of the config you have a mixed bag (e.g., hardened
usercopy but *no* init_on_alloc) so I genuinely don't know.

Given the high cost of the opt I would suggest removing it, as it
avoidably muddles the waters for single-threaded changes (one way or
the other -- slowdowns can hide and speed ups go unnoticed).

I did not review the whole config.

Any comments? :)

Thanks,
-- 
Mateusz Guzik <mjguzik gmail.com>
