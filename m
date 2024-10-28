Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com [209.85.167.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02F4E55E73
	for <oe-lkp@lists.linux.dev>; Mon, 28 Oct 2024 15:15:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730128549; cv=none; b=NaEcFat/RYK5JIzmjJ3BFrbztFRZWmiCO7BQ5MkWrgHub+mclDJK9ufz6roevz3qcrKcvfvYp7lWW6M2DfRLrL8fOG5i0LTfhKC6mIcU0GN7BTAdbHItC02Lz22BZ8++OHnDiirWFeoIvt/XaDe/EomUrku0ymSkbwmWwzH9wpU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730128549; c=relaxed/simple;
	bh=8kijLKCe9/u6hJG2B0Upu24V5HO2+0j+WKWv+aXrPEI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Q6z4pIRZkkdRBohSvawbXBPRAB7UTtD84yNZyzP0AQzQkx8PjrkOeMdwMeXml6FVKQy/QS9YkMn1TFm4OZGuPvyHJcgb11xZog7tQxjUl4oyWvoXtUb1tqO23B5l261cLtL7iAWyoN9eEa4c5UiYfwNoIXnAn59quMt9yXmX5Sc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=H97ROZW6; arc=none smtp.client-ip=209.85.167.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="H97ROZW6"
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-539e66ba398so15712e87.0
        for <oe-lkp@lists.linux.dev>; Mon, 28 Oct 2024 08:15:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1730128546; x=1730733346; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8kijLKCe9/u6hJG2B0Upu24V5HO2+0j+WKWv+aXrPEI=;
        b=H97ROZW6HJhYt0e6qYX94WeEflIVslNIrVaVKvW8ggeMri4eCxL2mx0pU12ZQ/myiU
         HozN72eAwo4QKBBygBn48rqxOwIxWSdFQSNYQmoZ8O/GRh9bDWiPg+5QFsky2Z2xm5WQ
         E+OvrcABMmokPQsWp64HRaKRiMRJ6DGG//5B+MOrT9ak3NNycZ9iajfxWIl0xoXz8Cl+
         e7AUHWterTzBCCGCLEAQTTh8wOx9uOAjmRI+zeglIjn3ZGPrlNve3kgyJYk72wS8Zc61
         QA+P/3o6KPHhk9JKHSitGKrwODiiTXBQ2LMHbeieP3x5HbGBYIExhYsp4F3whAQGwZ/F
         I4uA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730128546; x=1730733346;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8kijLKCe9/u6hJG2B0Upu24V5HO2+0j+WKWv+aXrPEI=;
        b=M74kvVQUpxNmjMbemS8gHOYkYyyMFEfuYz93v8dLArNWrZf+rCdD6K6skGoGXgsg9j
         993IvuHybRhARQqbDfMmm+el1fppE5GMLcIYgZHS5WPgEwpJU9sQohCK9PGjv0DWBPGq
         9QuZ9AKq52ZuOT2/3onLEUar3dnxZMjorVcmXVUZHIbNhiikb2pI8d02Tb5GYNHc9nyo
         6bdGN23mLcZSB5v3itK+4xzk+bgPevl3+WPhGcNWM6rWElOiZD6VokEHTp9wVQaxUY6V
         adrB+M5Va5Jhjz9HtoYfWtEx+RQjNa6L714Y5n+zGitFV4QAHX3jqw7DPd/MPdf3tIkT
         2+Ew==
X-Gm-Message-State: AOJu0YwRgNw8Spj7mjP+kfLfjNB1eRN9nZViI0EyzGec/R4BH4WfT7W3
	xiO+6vgrPLp8IOZrsa8OlSoqDVkG4qOpMk68Y8T+mT9MzuqVTnB0NwvUINujHUK7BwyEM8vi0SW
	M+O6aWJVSPrqKKAMHJbpCUY/Oa/zj+Js3q6Zj
X-Google-Smtp-Source: AGHT+IHhlr80qnjoc3qPeloimsNoLpzMT+nVpsqmMp/GNu8LTEZexj0DumIAuFBPOq8X0buSO+lGjgFpbMJGOi/NiT8=
X-Received: by 2002:a05:6512:10d0:b0:538:9e44:3034 with SMTP id
 2adb3069b0e04-53b348e3504mr295422e87.6.1730128545894; Mon, 28 Oct 2024
 08:15:45 -0700 (PDT)
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <202410281414.c351044e-oliver.sang@intel.com> <CAH5fLggdtev=scJ1C9EefZf-fVrMvgMbfD+b_T5vFfHqNTn8Kw@mail.gmail.com>
In-Reply-To: <CAH5fLggdtev=scJ1C9EefZf-fVrMvgMbfD+b_T5vFfHqNTn8Kw@mail.gmail.com>
From: Sami Tolvanen <samitolvanen@google.com>
Date: Mon, 28 Oct 2024 08:15:07 -0700
Message-ID: <CABCJKudR2UwvR8x4MwKYPmHETMz+aoiXEXz135BoufTF9Pt2Gg@mail.gmail.com>
Subject: Re: [linus:master] [cfi] 8b8ca9c25f: CFI_failure_at_do_basic_setup
To: Alice Ryhl <aliceryhl@google.com>
Cc: oe-lkp@lists.linux.dev, lkp@intel.com, linux-kernel@vger.kernel.org, 
	kernel test robot <oliver.sang@intel.com>, Miguel Ojeda <ojeda@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 28, 2024 at 1:34=E2=80=AFAM Alice Ryhl <aliceryhl@google.com> w=
rote:
>
> Hmm. This config has:
>
> CONFIG_CLANG_VERSION=3D190102
>
> Sami, is the fix not available as of llvm 19?

Looks like llvmorg-19.1.2 doesn't have the fix, which means it won't
be available until LLVM 20. :/

Sami
