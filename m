Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47336433B3
	for <oe-lkp@lists.linux.dev>; Thu, 27 Jun 2024 17:20:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719508818; cv=none; b=ZFEQsJu8LT8oYtKannu9IlD2Zub2zx62PTShcKppNU8K77bfv9D6PsFFna82Lq8K24tLm/qE6JQRxBFqnnyx7N5XJ9ZTi25BmZKjrD4OsOeGUBK3CLjWLw0o12KL7MHPH2ObJWV7Les7DHEwD+SrEabe2AiqAtCkJk2qRJd9Sto=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719508818; c=relaxed/simple;
	bh=azyPuelYFgTE6kdMySGrFuGBslfZhPvhxh5uHAHzalg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=PreCf+ri+cU8Y8KI9TIHTl30sZULGeUB0znRKputkP/bUHU5ucE5mb01Env0MV4WWbxJvicAIZnjYauQ0QhsrTLBGyI9xn+UPpmeBu9hQ2zDQzorMMpK6Od6ZMGmrzyrLrFliAKD8FtyDgozDfOeObuK+71f9b+HX+22JSuptvE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fFixVL70; arc=none smtp.client-ip=209.85.208.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fFixVL70"
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-57d106e69a2so373545a12.0
        for <oe-lkp@lists.linux.dev>; Thu, 27 Jun 2024 10:20:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1719508816; x=1720113616; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GqlEDMHapqLffHeKiUQnC/6l2aCqeZ+JOD7CIqp8bOc=;
        b=fFixVL70XK0g713+Q6o5mKJoulI3m29lr9C+5ePS0M5dkufmGDOwTnQoCFBu+dhg50
         fSUphnq4Vy6TfOydqWYap2RdaLKpsqrsCT/xgwnpF2/PLzuZgg+63dk0DoHBXBLzXkht
         u76qf5iYQ1zOjP9MGriezivzk+WsS3Yo7ivzIwu5IJ7bTaGQhhrSe+vSZlUopby5e/eo
         NREu8DKosc1Fu9Aml+qv+2zaVN+YjejZF18NXJWrFTb7gFAOHRxDK1haQhqn/hR23ESq
         CLwIdZUnDqyqntrFmVXZJwuiNZ/4M6zroUDnwfJ+RHoFcYXTGxur8oskLfeFOPbjiPid
         U0mA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719508816; x=1720113616;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GqlEDMHapqLffHeKiUQnC/6l2aCqeZ+JOD7CIqp8bOc=;
        b=V15QQlPn5QSNeumuyzWtq63TMMT9aXiwJLlLcnjiAgKHCHFLSnCVEnoDnz0EOoZfXs
         ipo6hi7y04zixd6hpNoRodzlQBiQwuHrp5GSNHWrNC2GKw6WwfRWuWxUZFnFtnvTSjE/
         yoFpKGOaLRbix/qcVyuC4a2rHMFlYqZNVbosVhfO6OIpWQxJ5fWOB2ARz1ftY1I5rt6Q
         2+fiQb04ETKxcSbecVeMMyaD7uYwIP19or/JZoql/TCdhuNDyaeORc47iRNAxmP+2bVn
         eX9q5Y/IKqI6NsyS9qcS9Rqq5pswq+eheAAfT/gcu4bq37UNqKNe9tBTV2vYkWL36W6Q
         9VWw==
X-Forwarded-Encrypted: i=1; AJvYcCU0Vzuq8QdTXgRV9eNuW9Uz6/Fe1ummD2Qpjj3JcFHeIyGMHGYp789YtLRW5ZyALCR0ZewqKgN2bN6ojTjvZop65GQWGdyq
X-Gm-Message-State: AOJu0YyDRt+50vgdCLUe6DHFuULy1c7icj/5sDI1KAeWEA4/Z4sIx5Tb
	HK1ttPQ+28Sv6oDprMibf3qm7OwskjRJe8OujevtqxAIEPxPp0tGSylj9LAuKqQZ3Xqi8OrTQQ1
	8fvd7B4wowKS6v07USSIjrLpldPINJhIAImY=
X-Google-Smtp-Source: AGHT+IG4CWSu9QAjyTQd/bZVVvY2xjOLF/BaGGxQpg5/QJVsTWHeQe2x8nTRh1GZOTs0VBpdd56xBsibnHwZCgkG43I=
X-Received: by 2002:a50:871d:0:b0:57d:46f:2cb9 with SMTP id
 4fb4d7f45d1cf-5847bad65e5mr2813927a12.13.1719508815637; Thu, 27 Jun 2024
 10:20:15 -0700 (PDT)
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <202406270912.633e6c61-oliver.sang@intel.com> <CAGudoHF7ys8bTCE0G6vLzEbo+_NyQXmAEEGPJ4hx1yoYmBsoUA@mail.gmail.com>
 <CAGudoHFrMkdo1CoVxJUiEvQ_DyW3hzaCz18GjvLi4ny=o-q9ZQ@mail.gmail.com>
 <CAHk-=wg7PXo_QbBo8gv27OpbMgAwLh9H46kJRxAmp0FL0QD7HA@mail.gmail.com> <CAHk-=wjkn=yL6vy5s7ZFgBfDybD3Gjg9C72zXchy-JF0Tp+a+A@mail.gmail.com>
In-Reply-To: <CAHk-=wjkn=yL6vy5s7ZFgBfDybD3Gjg9C72zXchy-JF0Tp+a+A@mail.gmail.com>
From: Mateusz Guzik <mjguzik@gmail.com>
Date: Thu, 27 Jun 2024 19:20:03 +0200
Message-ID: <CAGudoHGuf8JZJjMcs+aYPN7jH+q6Og2CNvSg1-qjJ8kH6SJbJg@mail.gmail.com>
Subject: Re: [linux-next:master] [lockref] d042dae6ad: unixbench.throughput
 -33.7% regression
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: kernel test robot <oliver.sang@intel.com>, oe-lkp@lists.linux.dev, lkp@intel.com, 
	Linux Memory Management List <linux-mm@kvack.org>, Christian Brauner <brauner@kernel.org>, linux-kernel@vger.kernel.org, 
	ying.huang@intel.com, feng.tang@intel.com, fengwei.yin@intel.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jun 27, 2024 at 6:57=E2=80=AFPM Linus Torvalds
<torvalds@linux-foundation.org> wrote:
>
> On Thu, 27 Jun 2024 at 09:32, Linus Torvalds
> <torvalds@linux-foundation.org> wrote:
> >
> >   getdent subtest:
> >       +4.1   lockref_put_return
> >       +5.7   lockref_get_not_dead
> >      +68.0   native_queued_spin_lock_slowpath
>
> For this getdents load, the main call chains that terminate in the
> queued spinlock case seem to be
>
> .lockref_get_not_dead.__legitimize_path.try_to_unlazy_next.lookup_fast
> .lockref_get_not_dead.__legitimize_path.try_to_unlazy.lookup_fast
> .lockref_get_not_dead.__legitimize_path.try_to_unlazy.link_path_walk
> .dput.terminate_walk.path_openat.do_filp_open
>
> which is interesting because I would have expected the readdir() code
> itself to show up.
>
> But the proc_pident_readdir profiles have all gone down, presumably
> because there's just much fewer of them. That part shows no spinlock
> in the profile at all.
>
> WTH is that benchmark doing? The only readdir that shows up is for
> what looks like some /proc filesystem thing.
>

[snip]
[pid 24603] openat(AT_FDCWD, "/proc/146/task/146/ns", O_RDONLY|O_DIRECTORY)=
 =3D 8
[pid 24603] getdents(1048577, 0x561c7bb02b90, 131072) =3D -1 EBADF (Bad
file descriptor)
[pid 24603] getdents(8, 0x561c7bb02b90, 0) =3D -1 EINVAL (Invalid argument)
[pid 24603] getdents(8, 0x561c7bb02b90 /* 12 entries */, 131072) =3D 328
[pid 24603] getdents(8, 0x561c7bb02b90 /* 0 entries */, 131072) =3D 0
[pid 24603] close(8)                    =3D 0
[/snip]

Calls with EBADF and EINVAL show up on my debian version and also on
the version I compiled from their repo
(https://github.com/ColinIanKing/stress-ng.git).

This runs over this collection:
               ret =3D stress_getdents_rand(args, "/proc", true, 8,
bad_fd, &duration, &count);
                if (ret =3D=3D -ENOSYS)
                        break;
                ret =3D stress_getdents_rand(args, "/dev", true, 1,
bad_fd, &duration, &count);
                if (ret =3D=3D -ENOSYS)
                        break;
                ret =3D stress_getdents_rand(args, "/tmp", true, 4,
bad_fd, &duration, &count);
                if (ret =3D=3D -ENOSYS)
                        break;
                ret =3D stress_getdents_rand(args, "/sys", true, 8,
bad_fd, &duration, &count);
                if (ret =3D=3D -ENOSYS)
                        break;
                ret =3D stress_getdents_rand(args, "/run", true, 2,
bad_fd, &duration, &count);
                if (ret =3D=3D -ENOSYS)
                        break;

hence weird stuff mutex and rwsem stuff as well.

All in all I don't think this is a legitimate benchmark per se, but it
may be it is doing something similar to what a real workload would do
elsewhere with lockref. On that front alone it warrants figuring out
(and I am going to sort it out, see my other e-mail).

--=20
Mateusz Guzik <mjguzik gmail.com>
